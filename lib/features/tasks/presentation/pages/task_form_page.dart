import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../data/models/todo_task.dart';
import '../../../../data/models/task_tag.dart';
import '../../../../data/models/importance_level.dart';
import '../../../../data/models/task_status.dart';
import '../../../../data/models/recurring_pattern.dart';
import '../../../../shared/widgets/metro_button.dart';
import '../../providers/task_providers.dart';
import '../../../recurring/providers/recurring_providers.dart';
import '../widgets/importance_selector.dart';
import '../widgets/date_picker_field.dart';
import '../widgets/tag_selector.dart';
import '../../../recurring/presentation/widgets/recurrence_pattern_selector.dart';

/// Page for creating or editing a task
class TaskFormPage extends ConsumerStatefulWidget {
  const TaskFormPage({
    super.key,
    this.task,
  });

  /// Task to edit (null for creating new task)
  final TodoTask? task;

  @override
  ConsumerState<TaskFormPage> createState() => _TaskFormPageState();
}

class _TaskFormPageState extends ConsumerState<TaskFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  late ImportanceLevel _selectedImportance;
  late TaskStatus _selectedStatus;
  DateTime? _selectedDueDate;
  List<TaskTag> _selectedTags = [];
  bool _isLoading = false;

  // Recurrence fields
  bool _isRecurring = false;
  RecurringPattern? _recurrencePattern;

  bool get isEditMode => widget.task != null;
  bool get isEditingRecurringTemplate => isEditMode && widget.task!.isRecurringTemplate;

  @override
  void initState() {
    super.initState();
    _initializeForm();
  }

  void _initializeForm() {
    if (isEditMode) {
      // Editing existing task
      final task = widget.task!;
      _titleController.text = task.title;
      _descriptionController.text = task.description ?? '';
      _selectedImportance = task.importance;
      _selectedStatus = task.status;
      _selectedDueDate = task.dueDate;
      // Tags will be loaded from the task.tags relationship
      _selectedTags = task.tags.toList();
      // Recurrence settings
      _isRecurring = task.isRecurring;
      if (task.recurringPatternId != null) {
        _loadPattern(task.recurringPatternId!);
      }
    } else {
      // Creating new task - set defaults
      _selectedImportance = ImportanceLevel.medium;
      _selectedStatus = TaskStatus.notStarted;
    }
  }

  Future<void> _loadPattern(int patternId) async {
    final patternRepo = ref.read(recurringPatternRepositoryProvider);
    final pattern = await patternRepo.getPattern(patternId);
    if (pattern != null && mounted) {
      setState(() {
        _recurrencePattern = pattern;
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          isEditMode ? 'Edit Task' : 'New Task',
          style: AppTypography.h3.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            // Title field
            TextFormField(
              controller: _titleController,
              style: AppTypography.body1.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              decoration: InputDecoration(
                labelText: 'Title *',
                labelStyle: AppTypography.body2.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                hintText: 'Enter task title',
                hintStyle: AppTypography.body1.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 1.5,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Title is required';
                }
                return null;
              },
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 24),

            // Description field
            TextFormField(
              controller: _descriptionController,
              style: AppTypography.body1.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              decoration: InputDecoration(
                labelText: 'Description (optional)',
                labelStyle: AppTypography.body2.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                hintText: 'Enter task description',
                hintStyle: AppTypography.body1.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                ),
              ),
              maxLines: 4,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 24),

            // Importance selector
            ImportanceSelector(
              selectedImportance: _selectedImportance,
              onImportanceChanged: (importance) {
                setState(() {
                  _selectedImportance = importance;
                });
              },
            ),
            const SizedBox(height: 24),

            // Status selector (only show in edit mode)
            if (isEditMode) ...[
              _buildStatusSelector(),
              const SizedBox(height: 24),
            ],

            // Due date picker
            DatePickerField(
              label: _isRecurring ? 'Start Date' : 'Due Date',
              selectedDate: _selectedDueDate,
              onDateSelected: (date) {
                setState(() {
                  _selectedDueDate = date;
                });
              },
              firstDate: DateTime.now(),
            ),
            const SizedBox(height: 24),

            // Recurrence pattern selector (not shown when editing recurring instance)
            if (!isEditMode || isEditingRecurringTemplate) ...[
              Divider(color: Theme.of(context).dividerColor),
              const SizedBox(height: 16),
              RecurrencePatternSelector(
                isRecurring: _isRecurring,
                pattern: _recurrencePattern,
                startDate: _selectedDueDate,
                onChanged: (isRecurring, pattern) {
                  setState(() {
                    _isRecurring = isRecurring;
                    _recurrencePattern = pattern;
                  });
                },
              ),
              const SizedBox(height: 24),
            ],

            // Tag selector
            TagSelector(
              selectedTags: _selectedTags,
              onTagsChanged: (tags) {
                setState(() {
                  _selectedTags = tags;
                });
              },
            ),
            const SizedBox(height: 32),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: MetroButton(
                    onPressed: () => Navigator.pop(context),
                    variant: MetroButtonVariant.outlined,
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: MetroButton(
                    onPressed: _isLoading ? null : _saveTask,
                    isLoading: _isLoading,
                    child: Text(isEditMode ? 'Update' : 'Create'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Status',
          style: AppTypography.body2.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: TaskStatus.values.map((status) {
            final isSelected = status == _selectedStatus;
            final color = _getStatusColor(status);

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedStatus = status;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? color : color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isSelected ? color : color.withValues(alpha: 0.3),
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: Text(
                  _getStatusLabel(status),
                  style: AppTypography.caption.copyWith(
                    color: isSelected ? Colors.white : color,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Color _getStatusColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.notStarted:
        return Theme.of(context).colorScheme.onSurfaceVariant;
      case TaskStatus.inProgress:
        return Theme.of(context).colorScheme.primary;
      case TaskStatus.onHold:
        return AppColors.purple6;
      case TaskStatus.completed:
        return AppColors.purple4;
    }
  }

  String _getStatusLabel(TaskStatus status) {
    switch (status) {
      case TaskStatus.notStarted:
        return 'Not Started';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.onHold:
        return 'On Hold';
      case TaskStatus.completed:
        return 'Completed';
    }
  }

  Future<void> _saveTask() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      if (isEditMode) {
        // Update existing task
        final task = widget.task!;
        task.title = _titleController.text.trim();
        task.description = _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim();
        task.importance = _selectedImportance;
        task.status = _selectedStatus;
        task.dueDate = _selectedDueDate;

        // Update computed properties
        task.updateComputedProperties();

        // Update task
        final updateTask = ref.read(updateTaskProvider);
        await updateTask(task);

        // Handle tag changes
        final currentTagIds = task.tags.map((t) => t.id).toSet();
        final newTagIds = _selectedTags.map((t) => t.id).toSet();

        // Remove tags that are no longer selected
        for (final tag in task.tags.toList()) {
          if (!newTagIds.contains(tag.id)) {
            final removeTag = ref.read(removeTagFromTaskProvider);
            await removeTag(task, tag);
          }
        }

        // Add new tags
        for (final tag in _selectedTags) {
          if (!currentTagIds.contains(tag.id)) {
            final addTag = ref.read(addTagToTaskProvider);
            await addTag(task, tag);
          }
        }

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Task updated successfully'),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
          );
          Navigator.pop(context, true);
        }
      } else {
        // Create new task
        if (_isRecurring && _recurrencePattern != null) {
          // Create recurring task
          if (_selectedDueDate == null) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please select a start date for the recurring task'),
                  backgroundColor: Colors.red,
                ),
              );
            }
            return;
          }

          final template = TodoTask()
            ..uuid = const Uuid().v4()
            ..title = _titleController.text.trim()
            ..description = _descriptionController.text.trim().isEmpty
                ? null
                : _descriptionController.text.trim()
            ..importance = _selectedImportance
            ..status = _selectedStatus
            ..dueDate = _selectedDueDate
            ..createdAt = DateTime.now()
            ..isCompleted = false
            ..isRecurring = true
            ..isRecurringTemplate = true
            ..isRecurringException = false
            ..isSkipped = false;

          template.updateComputedProperties();

          final createRecurring = ref.read(createRecurringTaskProvider);
          await createRecurring(template: template, pattern: _recurrencePattern!);

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Recurring task created successfully'),
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
            );
            Navigator.pop(context, true);
          }
        } else {
          // Create regular task
          final createTask = ref.read(createTaskProvider);
          await createTask(
            title: _titleController.text.trim(),
            description: _descriptionController.text.trim().isEmpty
                ? null
                : _descriptionController.text.trim(),
            importance: _selectedImportance,
            status: _selectedStatus,
            dueDate: _selectedDueDate,
            tags: _selectedTags,
          );

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Task created successfully'),
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
            );
            Navigator.pop(context, true);
          }
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
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
