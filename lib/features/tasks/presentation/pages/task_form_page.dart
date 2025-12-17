import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../data/models/todo_task.dart';
import '../../../../data/models/task_tag.dart';
import '../../../../data/models/importance_level.dart';
import '../../../../data/models/task_status.dart';
import '../../../../data/models/recurring_pattern.dart';
import '../../../../data/models/notification_type.dart';
import '../../../../shared/widgets/metro_button.dart';
import '../../providers/task_providers.dart';
import '../../../recurring/providers/recurring_providers.dart';
import '../../../../data/providers/repository_providers.dart'; // Needed for tag repository
import '../widgets/importance_selector.dart';
import '../widgets/date_picker_field.dart';
import '../widgets/tag_selector.dart';
import '../../../recurring/presentation/widgets/recurrence_pattern_selector.dart';

/// Page for creating or editing a task
class TaskFormPage extends ConsumerStatefulWidget {
  const TaskFormPage({super.key, this.task});

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
  NotificationType _dueDateNotificationType = NotificationType.basic; // Notification type for due date
  List<DateTime> _reminders = []; // Multiple reminders
  final Map<DateTime, NotificationType> _reminderTypes = {}; // Notification type for each reminder
  List<TaskTag> _selectedTags = [];
  bool _isLoading = false;

  // Recurrence fields
  bool _isRecurring = false;
  RecurringPattern? _recurrencePattern;

  bool get isEditMode => widget.task != null;
  bool get isEditingRecurringTemplate =>
      isEditMode && widget.task!.isRecurringTemplate;

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

      _selectedImportance = ImportanceLevel.values.firstWhere(
        (e) => e.name == task.importance,
        orElse: () => ImportanceLevel.medium,
      );

      _selectedStatus = TaskStatus.values.firstWhere(
        (e) => e.name == task.status,
        orElse: () => TaskStatus.notStarted,
      );

      _selectedDueDate = task.dueDate;
      // Reminders loaded async
      _loadReminders(task.id);

      // Load tags asynchronously
      _loadTags(task.id);

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

  Future<void> _loadReminders(int taskId) async {
    try {
      final repo = ref.read(todoRepositoryProvider);
      final loaded = await repo.getReminders(taskId);
      if (mounted) {
        setState(() {
          _reminders = loaded.map((r) => r.scheduledAt).toList();
        });
      }
    } catch (e) {
      debugPrint('Error loading reminders: $e');
    }
  }

  Future<void> _loadTags(int taskId) async {
    // Delay slightly to ensure provider is ready if called immediately in initState
    // Or just call normally.
    try {
      final tagRepo = ref.read(tagRepositoryProvider);
      final tags = await tagRepo.getTagsForTask(taskId);
      if (mounted) {
        setState(() {
          _selectedTags = tags;
        });
      }
    } catch (e) {
      debugPrint('Error loading tags: $e');
    }
  }

  Future<void> _loadPattern(int patternId) async {
    try {
      final patternRepo = ref.read(recurringPatternRepositoryProvider);
      final pattern = await patternRepo.getPattern(patternId);
      if (pattern != null && mounted) {
        setState(() {
          _recurrencePattern = pattern;
        });
      }
    } catch (e) {
      debugPrint('Error loading pattern: $e');
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
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
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
                  borderSide: const BorderSide(color: Colors.red, width: 1.5),
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
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
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

            // Due Date & Time picker
            DateTimeSelectionField(
              label: _isRecurring ? 'Start Date' : 'Due Date & Time',
              selectedDateTime: _selectedDueDate,
              onDateTimeSelected: (date) {
                setState(() {
                  _selectedDueDate = date;
                });
              },
              firstDate: DateTime.now().subtract(
                const Duration(days: 365),
              ), // Allow past dates for reference? Or strict?
              // Typically allow past if editing, but for new tasks maybe today? Standard is allow past in case you forgot to log it.
              includeTime:
                  !_isRecurring, // Recurring start date usually just date, but could be specific time. Let's allow simple date for recurring.
            ),
            const SizedBox(height: 16),

            // Due date notification type selector
            if (_selectedDueDate != null && !_isRecurring) ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Due Date Notification Type',
                    style: AppTypography.body2.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SegmentedButton<NotificationType>(
                    segments: const [
                      ButtonSegment<NotificationType>(
                        value: NotificationType.basic,
                        icon: Icon(Icons.notifications),
                        label: Text('Basic Notification'),
                      ),
                      ButtonSegment<NotificationType>(
                        value: NotificationType.persistent,
                        icon: Icon(Icons.alarm),
                        label: Text('Alarm'),
                      ),
                    ],
                    selected: {_dueDateNotificationType},
                    onSelectionChanged: (Set<NotificationType> newSelection) {
                      setState(() {
                        _dueDateNotificationType = newSelection.first;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],

            // Reminders Section
            if (!_isRecurring) ...[
              _buildRemindersSection(),
              const SizedBox(height: 24),
            ],

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
        return AppColors.notStarted;
      case TaskStatus.inProgress:
        return AppColors.inProgress;
      case TaskStatus.onHold:
        return AppColors.onHold;
      case TaskStatus.completed:
        return AppColors.completed;
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

  Widget _buildRemindersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Reminders',
              style: AppTypography.body2.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton.icon(
              onPressed: _showAddReminderPicker,
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Add'),
            ),
          ],
        ),
        if (_reminders.isNotEmpty) ...[
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Theme.of(context).colorScheme.outline),
            ),
            child: Column(
              children: _reminders.asMap().entries.map((entry) {
                final index = entry.key;
                final reminder = entry.value;
                return Column(
                  children: [
                    if (index > 0)
                      Divider(
                        height: 1,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.alarm,
                                color: Theme.of(context).colorScheme.primary,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  DateFormat('MMM d, y @ h:mm a').format(reminder),
                                  style: AppTypography.body2,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.close, size: 20),
                                onPressed: () {
                                  setState(() {
                                    _reminders.removeAt(index);
                                    _reminderTypes.remove(reminder);
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // Notification type selector
                          Row(
                            children: [
                              const SizedBox(width: 28), // Align with text
                              Expanded(
                                child: SegmentedButton<NotificationType>(
                                  segments: const [
                                    ButtonSegment<NotificationType>(
                                      value: NotificationType.basic,
                                      icon: Icon(Icons.notifications, size: 16),
                                      label: Text('Basic', style: TextStyle(fontSize: 12)),
                                    ),
                                    ButtonSegment<NotificationType>(
                                      value: NotificationType.persistent,
                                      icon: Icon(Icons.alarm, size: 16),
                                      label: Text('Alarm', style: TextStyle(fontSize: 12)),
                                    ),
                                  ],
                                  selected: {_reminderTypes[reminder] ?? NotificationType.basic},
                                  onSelectionChanged: (Set<NotificationType> newSelection) {
                                    setState(() {
                                      _reminderTypes[reminder] = newSelection.first;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ] else
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'No reminders set',
              style: AppTypography.caption.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
      ],
    );
  }

  Future<void> _showAddReminderPicker() async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
    );

    if (date != null && mounted) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (time != null && mounted) {
        final reminder = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );
        setState(() {
          _reminders.add(reminder);
          _reminders.sort(); // Keep sorted
          _reminderTypes[reminder] = NotificationType.basic; // Default to basic notification
        });
      }
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

        // Use constructor instead of copyWith to explicitly handle nullable fields
        final updatedTask = TodoTask(
          id: task.id,
          uuid: task.uuid,
          title: _titleController.text.trim(),
          description: _descriptionController.text.trim().isEmpty
              ? null
              : _descriptionController.text.trim(),
          importance: _selectedImportance.name,
          status: _selectedStatus.name,
          dueDate: _selectedDueDate,
          reminderDateTime: _reminders.isNotEmpty ? _reminders.first : null,
          createdAt: task.createdAt,
          completedAt: task.completedAt,
          isCompleted: task.isCompleted,
          isRecurring: task.isRecurring,
          isRecurringTemplate: task.isRecurringTemplate,
          isRecurringException: task.isRecurringException,
          recurringSeriesId: task.recurringSeriesId,
          recurringPatternId: task.recurringPatternId,
          recurringInstanceNumber: task.recurringInstanceNumber,
          recurringOriginalDate: task.recurringOriginalDate,
          isSkipped: task.isSkipped,
          isDueToday: task.isDueToday,
          isOverdue: task.isOverdue,
        );

        // Update task
        // Update task via Repository directly to handle reminders
        // Update task via Provider to handle reminders and notifications
        final updateTask = ref.read(updateTaskProvider);
        await updateTask(
          updatedTask,
          reminders: _reminders,
          reminderTypes: _reminderTypes,
          dueDateNotificationType: _dueDateNotificationType,
        );

        // Handle tag changes using repository
        final tagRepo = ref.read(tagRepositoryProvider);
        final currentTags = await tagRepo.getTagsForTask(task.id);
        final currentTagIds = currentTags.map((t) => t.id).toSet();
        final newTagIds = _selectedTags.map((t) => t.id).toSet();

        // Remove tags that are no longer selected
        for (final tag in currentTags) {
          if (!newTagIds.contains(tag.id)) {
            final removeTag = ref.read(removeTagFromTaskProvider);
            await removeTag(updatedTask, tag);
          }
        }

        // Add new tags
        for (final tag in _selectedTags) {
          if (!currentTagIds.contains(tag.id)) {
            final addTag = ref.read(addTagToTaskProvider);
            await addTag(updatedTask, tag);
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
          final effectiveStartDate = _selectedDueDate ?? DateTime.now();

          final template = TodoTask(
            id: 0, // placeholder
            uuid: const Uuid().v4(),
            title: _titleController.text.trim(),
            description: _descriptionController.text.trim().isEmpty
                ? null
                : _descriptionController.text.trim(),
            importance: _selectedImportance.name,
            status: _selectedStatus.name,
            dueDate: effectiveStartDate,
            reminderDateTime: _reminders.isNotEmpty ? _reminders.first : null,
            createdAt: DateTime.now(),
            isCompleted: false,
            isRecurring: true,
            isRecurringTemplate: true,
            isRecurringException: false,
            isSkipped: false,
            isDueToday: false,
            isOverdue: false,
          );

          if (_recurrencePattern == null) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please configure recurrence pattern'),
                  backgroundColor: Colors.red,
                ),
              );
            }
            return;
          }

          final createRecurring = ref.read(createRecurringTaskProvider);
          await createRecurring(
            template: template,
            pattern: _recurrencePattern!,
          );

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
          // Use TodoRepository.createTodo which handles insertion

          // Create regular task using provider
          final createTask = ref.read(createTaskProvider);
          await createTask(
            title: _titleController.text.trim(),
            description: _descriptionController.text.trim().isEmpty
                ? null
                : _descriptionController.text.trim(),
            importance: _selectedImportance,
            status: _selectedStatus,
            dueDate: _selectedDueDate,
            dueDateNotificationType: _dueDateNotificationType,
            tags: _selectedTags, // Provider handles ID extraction
            reminders: _reminders,
            reminderTypes: _reminderTypes,
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

// End class
