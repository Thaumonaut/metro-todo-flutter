import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../data/models/todo_task.dart';
import '../../../../data/models/importance_level.dart';
import '../../../../data/models/task_status.dart';
import '../../../../data/providers/repository_providers.dart';
import '../../../tasks/presentation/widgets/bulk_action_bar.dart';
import 'task_summary_card.dart';

/// A generic reusable section for displaying a list of tasks
/// Supports selection mode for bulk operations
class TaskListSection extends ConsumerStatefulWidget {
  const TaskListSection({
    super.key,
    required this.title,
    required this.tasksAsync,
    required this.width,
    required this.emptyStateIcon,
    required this.emptyStateMessage,
    this.onTaskEdit,
    this.onTaskComplete,
    this.onTaskDelete,
    this.onTaskImportanceChange,
    this.onTaskStatusChange,
    this.onAddTask,
  });

  final String title;
  final AsyncValue<List<TodoTask>> tasksAsync;
  final double width;
  final IconData emptyStateIcon;
  final String emptyStateMessage;
  final void Function(TodoTask task)? onTaskEdit;
  final void Function(TodoTask task)? onTaskComplete;
  final void Function(TodoTask task)? onTaskDelete;
  final void Function(TodoTask task, ImportanceLevel importance)?
  onTaskImportanceChange;

  /// Callback when a task's status is changed
  final void Function(TodoTask task, TaskStatus status)? onTaskStatusChange;

  /// Callback to add a new task
  final VoidCallback? onAddTask;

  @override
  ConsumerState<TaskListSection> createState() => _TaskListSectionState();
}

class _TaskListSectionState extends ConsumerState<TaskListSection> {
  bool _isSelectionMode = false;
  final Set<int> _selectedTaskIds = {};

  void _toggleSelectionMode() {
    setState(() {
      _isSelectionMode = !_isSelectionMode;
      if (!_isSelectionMode) {
        _selectedTaskIds.clear();
      }
    });
  }

  void _toggleTaskSelection(TodoTask task) {
    setState(() {
      if (_selectedTaskIds.contains(task.id)) {
        _selectedTaskIds.remove(task.id);
        if (_selectedTaskIds.isEmpty) {
          _isSelectionMode = false;
        }
      } else {
        _selectedTaskIds.add(task.id);
      }
    });
  }

  void _selectAll(List<TodoTask> tasks) {
    setState(() {
      _selectedTaskIds.addAll(tasks.map((t) => t.id));
    });
  }

  void _cancelSelection() {
    setState(() {
      _isSelectionMode = false;
      _selectedTaskIds.clear();
    });
  }

  List<TodoTask> _getSelectedTasks(List<TodoTask> allTasks) {
    return allTasks.where((t) => _selectedTaskIds.contains(t.id)).toList();
  }

  Future<void> _bulkComplete(List<TodoTask> tasks) async {
    final repo = ref.read(todoRepositoryProvider);
    await repo.bulkComplete(tasks.map((t) => t.id).toList());
    _cancelSelection();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${tasks.length} tasks completed')),
      );
    }
  }

  Future<void> _bulkDelete(List<TodoTask> tasks) async {
    final repo = ref.read(todoRepositoryProvider);
    await repo.bulkDelete(tasks.map((t) => t.id).toList());
    _cancelSelection();
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('${tasks.length} tasks deleted')));
    }
  }

  Future<void> _bulkChangeImportance(
    List<TodoTask> tasks,
    ImportanceLevel importance,
  ) async {
    final repo = ref.read(todoRepositoryProvider);
    await repo.bulkUpdateImportance(
      tasks.map((t) => t.id).toList(),
      importance,
    );
    _cancelSelection();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Updated importance for ${tasks.length} tasks')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.tasksAsync.when(
      data: (tasks) => _buildContent(tasks),
      loading: () => _buildLoading(),
      error: (error, _) => _buildError(),
    );
  }

  Widget _buildContent(List<TodoTask> tasks) {
    final selectedTasks = _getSelectedTasks(tasks);

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section header with selection toggle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title.toLowerCase(),
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w300,
                      letterSpacing: -1.0,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  if (tasks.isNotEmpty || widget.onAddTask != null)
                    Row(
                      children: [
                        if (_isSelectionMode) ...[
                          TextButton(
                            onPressed: () => _selectAll(tasks),
                            child: const Text('Select All'),
                          ),
                        ] else if (widget.onAddTask != null) ...[
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: widget.onAddTask,
                            tooltip: 'Add Task',
                          ),
                          if (tasks.isNotEmpty) const SizedBox(width: 8),
                        ],
                        if (tasks.isNotEmpty)
                          IconButton(
                            icon: Icon(
                              _isSelectionMode ? Icons.close : Icons.checklist,
                            ),
                            onPressed: _toggleSelectionMode,
                            tooltip: _isSelectionMode
                                ? 'Cancel'
                                : 'Select multiple',
                          ),
                      ],
                    ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Tasks list
            Expanded(
              child: tasks.isEmpty
                  ? _buildEmptyState()
                  : _buildTasksList(tasks),
            ),
          ],
        ),

        // Bulk action bar
        if (_isSelectionMode && selectedTasks.isNotEmpty)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BulkActionBar(
              selectedTasks: selectedTasks,
              onComplete: () => _bulkComplete(selectedTasks),
              onDelete: () => _bulkDelete(selectedTasks),
              onChangeImportance: (importance) =>
                  _bulkChangeImportance(selectedTasks, importance),
              onCancel: _cancelSelection,
            ),
          ),
      ],
    );
  }

  Widget _buildLoading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            widget.title.toLowerCase(),
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w300,
              letterSpacing: -1.0,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        const Expanded(child: Center(child: CircularProgressIndicator())),
      ],
    );
  }

  Widget _buildError() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            widget.title.toLowerCase(),
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w300,
              letterSpacing: -1.0,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              'Error loading tasks',
              style: AppTypography.body1.copyWith(color: AppColors.error),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(widget.emptyStateIcon, size: 64, color: AppColors.textHint),
          const SizedBox(height: 16),
          Text(
            widget.emptyStateMessage,
            style: AppTypography.body1.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildTasksList(List<TodoTask> tasks) {
    return ListView.builder(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: _isSelectionMode ? 80 : 0,
      ),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        final isSelected = _selectedTaskIds.contains(task.id);

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: GestureDetector(
            onLongPress: () {
              if (!_isSelectionMode) {
                setState(() {
                  _isSelectionMode = true;
                  _selectedTaskIds.add(task.id);
                });
              }
            },
            onTap: _isSelectionMode ? () => _toggleTaskSelection(task) : null,
            child: TaskSummaryCard(
              task: task,
              width: widget.width - 48,
              isSelectionMode: _isSelectionMode,
              isSelected: isSelected,
              onEdit: _isSelectionMode
                  ? null
                  : (widget.onTaskEdit != null
                        ? () => widget.onTaskEdit!(task)
                        : null),
              onComplete: _isSelectionMode
                  ? null
                  : (widget.onTaskComplete != null
                        ? () => widget.onTaskComplete!(task)
                        : null),
              onDelete: _isSelectionMode
                  ? null
                  : (widget.onTaskDelete != null
                        ? () => widget.onTaskDelete!(task)
                        : null),
              onImportanceChange: _isSelectionMode
                  ? null
                  : (widget.onTaskImportanceChange != null
                        ? (importance) =>
                              widget.onTaskImportanceChange!(task, importance)
                        : null),
              onStatusChange: _isSelectionMode
                  ? null
                  : (widget.onTaskStatusChange != null
                        ? (status) => widget.onTaskStatusChange!(task, status)
                        : null),
            ),
          ),
        );
      },
    );
  }
}
