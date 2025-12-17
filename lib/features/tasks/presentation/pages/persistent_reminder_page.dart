import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/models/todo_task.dart';
import '../../../../data/services/notification_service.dart';
import '../../../../core/theme/app_typography.dart';
import '../../providers/task_providers.dart';

/// Full-screen alarm-style reminder page for persistent notifications
/// Shows when a persistent reminder fires, requiring user action
class PersistentReminderPage extends ConsumerStatefulWidget {
  final int taskId;

  const PersistentReminderPage({
    super.key,
    required this.taskId,
  });

  @override
  ConsumerState<PersistentReminderPage> createState() =>
      _PersistentReminderPageState();
}

class _PersistentReminderPageState
    extends ConsumerState<PersistentReminderPage> {
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    final taskAsync = ref.watch(taskByIdProvider(widget.taskId));

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.errorContainer,
      body: SafeArea(
        child: taskAsync.when(
          data: (task) {
            if (task == null) {
              return _buildTaskNotFound();
            }
            return _buildReminderContent(task);
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => _buildError(error),
        ),
      ),
    );
  }

  Widget _buildReminderContent(TodoTask task) {
    return Column(
      children: [
        // Header with pulsing alarm icon
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.error,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Pulsing alarm icon
                TweenAnimationBuilder(
                  duration: const Duration(milliseconds: 1000),
                  tween: Tween<double>(begin: 0.8, end: 1.2),
                  builder: (context, double scale, child) {
                    return Transform.scale(
                      scale: scale,
                      child: Icon(
                        Icons.alarm,
                        size: 120,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    );
                  },
                  onEnd: () {
                    if (mounted) setState(() {});
                  },
                ),
                const SizedBox(height: 24),
                Text(
                  'Task Reminder',
                  style: AppTypography.h2.copyWith(
                    color: Theme.of(context).colorScheme.onError,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Task details
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Task title
                Text(
                  task.title,
                  style: AppTypography.h3.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // Due date info
                if (task.dueDate != null) ...[
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 20,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _formatDueDate(task.dueDate!),
                        style: AppTypography.body1.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],

                // Description
                if (task.description != null &&
                    task.description!.isNotEmpty) ...[
                  Text(
                    task.description!,
                    style: AppTypography.body2.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 24),
                ],

                const Spacer(),

                // Action buttons
                _buildActionButtons(task),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(TodoTask task) {
    return Column(
      children: [
        // Complete button (primary action)
        SizedBox(
          width: double.infinity,
          height: 56,
          child: FilledButton.icon(
            onPressed: _isProcessing ? null : () => _handleComplete(task),
            icon: const Icon(Icons.check_circle, size: 24),
            label: const Text(
              'Mark as Complete',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Snooze button
        SizedBox(
          width: double.infinity,
          height: 56,
          child: OutlinedButton.icon(
            onPressed: _isProcessing ? null : () => _handleSnooze(task),
            icon: const Icon(Icons.snooze, size: 24),
            label: const Text(
              'Snooze 10 Minutes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Secondary actions row
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: _isProcessing ? null : () => _handleDelay(task),
                child: const Text('Delay 1 Hour'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextButton(
                onPressed: _isProcessing ? null : _handleDismiss,
                child: const Text('Dismiss'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTaskNotFound() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text(
            'Task Not Found',
            style: AppTypography.h3,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildError(Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text(
            'Error loading task',
            style: AppTypography.h3,
          ),
          const SizedBox(height: 8),
          Text(
            error.toString(),
            style: AppTypography.body2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  String _formatDueDate(DateTime dueDate) {
    final now = DateTime.now();
    final difference = dueDate.difference(now);

    if (difference.isNegative) {
      final absDiff = difference.abs();
      if (absDiff.inDays > 0) {
        return 'Overdue by ${absDiff.inDays} day${absDiff.inDays > 1 ? 's' : ''}';
      } else if (absDiff.inHours > 0) {
        return 'Overdue by ${absDiff.inHours} hour${absDiff.inHours > 1 ? 's' : ''}';
      } else {
        return 'Overdue by ${absDiff.inMinutes} minute${absDiff.inMinutes > 1 ? 's' : ''}';
      }
    } else {
      if (difference.inDays > 0) {
        return 'Due in ${difference.inDays} day${difference.inDays > 1 ? 's' : ''}';
      } else if (difference.inHours > 0) {
        return 'Due in ${difference.inHours} hour${difference.inHours > 1 ? 's' : ''}';
      } else {
        return 'Due in ${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''}';
      }
    }
  }

  Future<void> _handleComplete(TodoTask task) async {
    setState(() => _isProcessing = true);

    try {
      final completeTask = ref.read(completeTaskProvider);
      await completeTask(task);

      // Cancel the notification
      await NotificationService().cancelTaskNotification(task.id);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${task.title} marked as complete'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isProcessing = false);
      }
    }
  }

  Future<void> _handleSnooze(TodoTask task) async {
    setState(() => _isProcessing = true);

    try {
      // Cancel current notification
      await NotificationService().cancelTaskNotification(task.id);

      // Reschedule for 10 minutes from now
      final snoozeTime = DateTime.now().add(const Duration(minutes: 10));
      await NotificationService().scheduleSpecificReminder(task, snoozeTime);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Snoozed for 10 minutes'),
            backgroundColor: Colors.blue,
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isProcessing = false);
      }
    }
  }

  Future<void> _handleDelay(TodoTask task) async {
    setState(() => _isProcessing = true);

    try {
      // Cancel current notification
      await NotificationService().cancelTaskNotification(task.id);

      // Reschedule for 1 hour from now
      final delayTime = DateTime.now().add(const Duration(hours: 1));
      await NotificationService().scheduleSpecificReminder(task, delayTime);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Delayed for 1 hour'),
            backgroundColor: Colors.orange,
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isProcessing = false);
      }
    }
  }

  Future<void> _handleDismiss() async {
    if (mounted) {
      Navigator.pop(context);
    }
  }
}
