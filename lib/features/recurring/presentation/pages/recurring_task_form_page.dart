import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../data/models/todo_task.dart';
import '../../../../data/models/recurring_pattern.dart';
import '../../../../data/models/importance_level.dart';
import '../../../../data/models/task_status.dart';
import '../../../../core/providers/preferences_providers.dart';
import '../../providers/recurring_providers.dart';
import '../widgets/recurrence_pattern_selector.dart';

/// Form page for creating or editing recurring tasks
class RecurringTaskFormPage extends ConsumerStatefulWidget {
  final TodoTask? editTask;

  const RecurringTaskFormPage({
    super.key,
    this.editTask,
  });

  @override
  ConsumerState<RecurringTaskFormPage> createState() => _RecurringTaskFormPageState();
}

class _RecurringTaskFormPageState extends ConsumerState<RecurringTaskFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  late ImportanceLevel _importance;
  DateTime? _startDate;
  bool _isRecurring = true;
  RecurringPattern? _pattern;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initializeForm();
  }

  void _initializeForm() {
    if (widget.editTask != null) {
      _titleController.text = widget.editTask!.title;
      _descriptionController.text = widget.editTask!.description ?? '';
      _importance = widget.editTask!.importance;
      _startDate = widget.editTask!.dueDate;
      _isRecurring = widget.editTask!.isRecurring;

      // Load pattern if editing
      if (widget.editTask!.recurringPatternId != null) {
        _loadPattern(widget.editTask!.recurringPatternId!);
      }
    } else {
      final defaultImportance = ref.read(defaultImportanceProvider);
      _importance = defaultImportance;
      _startDate = DateTime.now();
    }
  }

  Future<void> _loadPattern(int patternId) async {
    final patternRepo = ref.read(recurringPatternRepositoryProvider);
    final pattern = await patternRepo.getPattern(patternId);
    if (pattern != null && mounted) {
      setState(() {
        _pattern = pattern;
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.editTask != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Recurring Task' : 'New Recurring Task'),
        actions: [
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            )
          else
            TextButton(
              onPressed: _saveTask,
              child: const Text('Save'),
            ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Title
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                hintText: 'Enter task title',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: 16),

            // Description
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description (optional)',
                hintText: 'Enter task description',
              ),
              maxLines: 3,
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: 24),

            // Importance
            Text(
              'Importance',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            SegmentedButton<ImportanceLevel>(
              segments: ImportanceLevel.values.map((level) {
                return ButtonSegment(
                  value: level,
                  label: Text(level.label),
                );
              }).toList(),
              selected: {_importance},
              onSelectionChanged: (Set<ImportanceLevel> selection) {
                setState(() {
                  _importance = selection.first;
                });
              },
            ),
            const SizedBox(height: 24),

            // Start date
            Text(
              'Start Date',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: Text(
                _startDate != null
                    ? '${_startDate!.day}/${_startDate!.month}/${_startDate!.year}'
                    : 'Select date',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: _selectStartDate,
              tileColor: Theme.of(context).colorScheme.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
            const SizedBox(height: 24),

            // Recurrence pattern
            Divider(),
            const SizedBox(height: 16),
            RecurrencePatternSelector(
              isRecurring: _isRecurring,
              pattern: _pattern,
              startDate: _startDate,
              onChanged: (isRecurring, pattern) {
                setState(() {
                  _isRecurring = isRecurring;
                  _pattern = pattern;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectStartDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );
    if (date != null) {
      setState(() {
        _startDate = date;
      });
    }
  }

  Future<void> _saveTask() async {
    if (!_formKey.currentState!.validate()) return;

    if (!_isRecurring || _pattern == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please configure the recurrence pattern')),
      );
      return;
    }

    if (_startDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a start date')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final template = TodoTask()
        ..uuid = const Uuid().v4()
        ..title = _titleController.text.trim()
        ..description = _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim()
        ..importance = _importance
        ..status = TaskStatus.notStarted
        ..dueDate = _startDate
        ..createdAt = DateTime.now()
        ..isCompleted = false
        ..isRecurring = true
        ..isRecurringTemplate = true
        ..isRecurringException = false
        ..isSkipped = false;

      template.updateComputedProperties();

      final createRecurring = ref.read(createRecurringTaskProvider);
      await createRecurring(template: template, pattern: _pattern!);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Recurring task created!')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
