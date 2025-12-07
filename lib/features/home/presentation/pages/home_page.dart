import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/features/tasks/presentation/pages/search_page.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../data/models/todo_task.dart';
import '../../../../data/models/importance_level.dart';
import '../../../../data/models/task_status.dart';
import '../../../../data/providers/repository_providers.dart';
import '../../providers/home_providers.dart';
import '../controllers/home_controller.dart';
import '../widgets/page_indicator.dart';
import '../widgets/overview_section.dart';
import '../widgets/task_list_section.dart';
import '../widgets/settings_section.dart';
import '../widgets/today_tasks_sheet.dart';
import '../widgets/quick_actions_menu.dart';
import '../../../tasks/presentation/pages/task_form_page.dart';
import '../../../tasks/presentation/pages/task_detail_page.dart';
import '../../../tasks/providers/task_providers.dart';
import '../../../tags/presentation/pages/tags_page.dart';
import '../../../recurring/presentation/pages/recurring_section.dart';

/// Main home page with true panoramic Metro-style horizontal scrolling
/// Each section is a full-width panel that you swipe between
///
/// This page has been refactored to follow MVVM architecture:
/// - View: This widget (minimal UI coordination)
/// - ViewModel: HomeController (navigation & business logic)
/// - Model: Providers (data layer)
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late final PageController _pageController;
  late final HomeController _controller;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.95);
    _controller = HomeController(pageController: _pageController);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final statsAsync = ref.watch(todoStatsProvider);
    final allTasksAsync = ref.watch(allTasksProvider);
    final completedTasksAsync = ref.watch(completedTasksProvider);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Custom Window Title Bar (Windows only) handled in main.dart
          Expanded(
            child: SafeArea(
              top: !Platform.isWindows,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // App header with navigation indicators
                  _buildHeader(),

                  // Panoramic horizontal scrolling sections
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                        },
                      ),
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        children: [
                          // Section 1: Overview/Statistics
                          OverviewSection(
                            width: screenWidth,
                            statsAsync: statsAsync,
                            onNewTaskTap: () => _navigateToTaskForm(),
                            onDueTodayTap: () => _showTodayTasksSheet(),
                            onMoreTap: () => _showQuickActionsMenu(),
                            onTaskEdit: (task) =>
                                _navigateToTaskDetail(task.id),
                            onTaskComplete: (task) => _completeTask(task),
                            onTaskDelete: (task) => _deleteTask(task),
                            onTaskImportanceChange: (task, importance) =>
                                _updateTaskImportance(task, importance),
                            onTaskStatusChange: (task, status) =>
                                _updateTaskStatus(task, status),
                          ),

                          // Section 2: All Tasks
                          TaskListSection(
                            title: 'All Tasks',
                            tasksAsync: allTasksAsync,
                            width: screenWidth,
                            emptyStateIcon: Icons.check_circle_outline,
                            emptyStateMessage: 'No tasks yet',
                            onTaskEdit: (task) =>
                                _navigateToTaskDetail(task.id),
                            onTaskComplete: (task) => _completeTask(task),
                            onTaskDelete: (task) => _deleteTask(task),
                            onTaskImportanceChange: (task, importance) =>
                                _updateTaskImportance(task, importance),
                            onTaskStatusChange: (task, status) =>
                                _updateTaskStatus(task, status),
                            onAddTask: () => _navigateToTaskForm(),
                          ),

                          // Section 3: Recurring Tasks
                          RecurringSection(width: screenWidth),

                          // Section 4: Completed Tasks
                          TaskListSection(
                            title: 'Completed',
                            tasksAsync: completedTasksAsync,
                            width: screenWidth,
                            emptyStateIcon: Icons.check_circle,
                            emptyStateMessage: 'No completed tasks yet',
                            onTaskEdit: (task) =>
                                _navigateToTaskDetail(task.id),
                            onTaskDelete: (task) => _deleteTask(task),
                            onTaskImportanceChange: (task, importance) =>
                                _updateTaskImportance(task, importance),
                            onTaskStatusChange: (task, status) =>
                                _updateTaskStatus(task, status),
                          ),

                          // Section 5: Settings
                          const SettingsSection(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the app header with title and navigation indicators
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // App title
          Text(
            'Metro Todo',
            style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.w300,
              letterSpacing: -2.0,
              height: 0.95,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),

          // Page indicators
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PageIndicator(
                  label: 'overview',
                  isActive: _currentPage == 0,
                  onTap: () => _controller.navigateToPage(0),
                ),
                const SizedBox(width: 12),
                PageIndicator(
                  label: 'all',
                  isActive: _currentPage == 1,
                  onTap: () => _controller.navigateToPage(1),
                ),
                const SizedBox(width: 12),
                PageIndicator(
                  label: 'recurring',
                  isActive: _currentPage == 2,
                  onTap: () => _controller.navigateToPage(2),
                ),
                const SizedBox(width: 12),
                PageIndicator(
                  label: 'done',
                  isActive: _currentPage == 3,
                  onTap: () => _controller.navigateToPage(3),
                ),
                const SizedBox(width: 12),
                PageIndicator(
                  label: 'settings',
                  isActive: _currentPage == 4,
                  onTap: () => _controller.navigateToPage(4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Navigate to task form for creating a new task
  Future<void> _navigateToTaskForm() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TaskFormPage()),
    );
  }

  /// Navigate to task detail page
  Future<void> _navigateToTaskDetail(int taskId) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TaskDetailPage(taskId: taskId)),
    );
  }

  void _showTodayTasksSheet() {
    TodayTasksSheet.show(context);
  }

  /// Navigate to tags page
  Future<void> _navigateToTagsPage() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TagsPage()),
    );
  }

  Future<void> _navigateToSearchPage() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchPage()),
    );
  }

  /// Complete a task via swipe action
  Future<void> _completeTask(TodoTask task) async {
    try {
      final completeTask = ref.read(completeTaskProvider);
      await completeTask(task);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${task.title} marked as complete'),
            backgroundColor: AppColors.purple4,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error completing task: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  /// Delete a task via swipe action
  Future<void> _deleteTask(TodoTask task) async {
    // Show confirmation dialog
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Text(
          'Delete Task?',
          style: AppTypography.h3.copyWith(color: AppColors.textPrimary),
        ),
        content: Text(
          'Are you sure you want to delete "${task.title}"? This action cannot be undone.',
          style: AppTypography.body1.copyWith(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              'Cancel',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('Delete', style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        final deleteTask = ref.read(deleteTaskProvider);
        await deleteTask(task);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${task.title} deleted'),
              backgroundColor: AppColors.error,
              duration: const Duration(seconds: 2),
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error deleting task: ${e.toString()}'),
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    }
  }

  /// Shows the quick actions menu
  void _showQuickActionsMenu() {
    QuickActionsMenu.show(
      context,
      onUrgentTap: () =>
          _controller.navigateToPage(2), // Now navigates to Recurring
      onTagsTap: () => _navigateToTagsPage(),
      onSearchTap: () {
        _navigateToSearchPage();
      },
      onSettingsTap: () => _controller.navigateToPage(4),
    );
  }

  /// Update a task's importance level
  Future<void> _updateTaskImportance(
    TodoTask task,
    ImportanceLevel importance,
  ) async {
    try {
      final updatedTask = task.copyWith(importance: importance.name);
      final updateTask = ref.read(updateTaskProvider);
      await updateTask(updatedTask);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Priority updated to ${importance.label}'),
            backgroundColor: AppColors.primary,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error updating priority: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  /// Update a task's status
  Future<void> _updateTaskStatus(TodoTask task, TaskStatus status) async {
    try {
      final updatedTask = task.copyWith(status: status.name);
      final updateTask = ref.read(updateTaskProvider);
      await updateTask(updatedTask);

      if (mounted) {
        String label = 'Status updated';
        switch (status) {
          case TaskStatus.notStarted:
            label = 'Marked as Not Started';
            break;
          case TaskStatus.inProgress:
            label = 'Marked as In Progress';
            break;
          case TaskStatus.onHold:
            label = 'Marked as On Hold';
            break;
          case TaskStatus.completed:
            label = 'Marked as Completed';
            break;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(label),
            backgroundColor: AppColors.primary,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error updating status: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }
}
