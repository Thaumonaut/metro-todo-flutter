import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../data/models/todo_task.dart';
import '../../../../data/models/recurring_pattern.dart';
import '../../../../data/providers/repository_providers.dart';
import '../../../home/providers/home_providers.dart';
import '../../../tasks/presentation/pages/task_form_page.dart';
import '../../providers/recurring_providers.dart';

/// Section displaying recurring tasks - replaces the Urgent section
class RecurringSection extends ConsumerWidget {
  final double width;

  const RecurringSection({super.key, required this.width});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final templatesAsync = ref.watch(homeRecurringTemplatesProvider);
    final instancesAsync = ref.watch(homeRecurringInstancesProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'recurring',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -1.0,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => _navigateToRecurringForm(context),
                tooltip: 'New Recurring Task',
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Templates section
          Text(
            'templates',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.3,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 12),

          templatesAsync.when(
            data: (templates) {
              if (templates.isEmpty) {
                return _buildEmptyState(
                  context,
                  icon: Icons.repeat,
                  message: 'No recurring tasks yet',
                  actionLabel: 'Create one',
                  onAction: () => _navigateToRecurringForm(context),
                );
              }
              return Column(
                children: templates
                    .map(
                      (template) => _buildTemplateCard(context, ref, template),
                    )
                    .toList(),
              );
            },
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: CircularProgressIndicator(),
              ),
            ),
            error: (error, stack) =>
                _buildErrorState(context, error.toString()),
          ),

          const SizedBox(height: 24),

          // Upcoming instances
          Text(
            'upcoming (next 14 days)',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.3,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 12),

          instancesAsync.when(
            data: (instances) {
              if (instances.isEmpty) {
                return _buildEmptyState(
                  context,
                  icon: Icons.event_available,
                  message: 'No upcoming recurring tasks',
                );
              }
              return Column(
                children: instances
                    .map(
                      (instance) => _buildInstanceCard(context, ref, instance),
                    )
                    .toList(),
              );
            },
            loading: () => const SizedBox.shrink(),
            error: (error, stack) =>
                _buildErrorState(context, error.toString()),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildTemplateCard(
    BuildContext context,
    WidgetRef ref,
    TodoTask template,
  ) {
    final patternAsync = template.recurringPatternId != null
        ? ref.watch(patternForTemplateProvider(template.recurringPatternId!))
        : null;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _showTemplateOptions(context, ref, template),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.repeat,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          template.title,
                          style: AppTypography.body1.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (patternAsync != null)
                          patternAsync.when(
                            data: (pattern) => pattern != null
                                ? Text(
                                    _getPatternDescription(pattern),
                                    style: AppTypography.body2.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            loading: () => const SizedBox.shrink(),
                            error: (error, stack) => const SizedBox.shrink(),
                          ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                  ),
                ],
              ),
              if (template.dueDate != null) ...[
                const SizedBox(height: 8),
                Text(
                  'Started: ${DateFormat('MMM d, yyyy').format(template.dueDate!)}',
                  style: AppTypography.caption.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInstanceCard(
    BuildContext context,
    WidgetRef ref,
    TodoTask instance,
  ) {
    final isOverdue = instance.isOverdue;
    final isDueToday = instance.isDueToday;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: _getDateColor(
              isOverdue,
              isDueToday,
              context,
            ).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              instance.dueDate != null
                  ? DateFormat('d').format(instance.dueDate!)
                  : '?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _getDateColor(isOverdue, isDueToday, context),
              ),
            ),
          ),
        ),
        title: Text(
          instance.title,
          style: TextStyle(
            decoration: instance.isCompleted
                ? TextDecoration.lineThrough
                : null,
          ),
        ),
        subtitle: Text(
          instance.dueDate != null
              ? DateFormat('EEEE, MMM d').format(instance.dueDate!)
              : 'No date',
          style: TextStyle(
            color: _getDateColor(isOverdue, isDueToday, context),
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.check_circle_outline),
              onPressed: () => _completeInstance(ref, instance),
              tooltip: 'Complete',
            ),
            IconButton(
              icon: const Icon(Icons.skip_next),
              onPressed: () => _skipInstance(ref, instance),
              tooltip: 'Skip',
            ),
          ],
        ),
      ),
    );
  }

  Color _getDateColor(bool isOverdue, bool isDueToday, BuildContext context) {
    if (isOverdue) return AppColors.error;
    if (isDueToday) return Theme.of(context).colorScheme.primary;
    return Theme.of(context).colorScheme.onSurfaceVariant;
  }

  Widget _buildEmptyState(
    BuildContext context, {
    required IconData icon,
    required String message,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 48,
            color: Theme.of(
              context,
            ).colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: AppTypography.body1.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          if (actionLabel != null && onAction != null) ...[
            const SizedBox(height: 16),
            OutlinedButton(onPressed: onAction, child: Text(actionLabel)),
          ],
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Text(
        'Error: $message',
        style: TextStyle(color: Theme.of(context).colorScheme.error),
      ),
    );
  }

  String _getPatternDescription(RecurringPattern pattern) {
    final interval = pattern.interval == 1 ? '' : '${pattern.interval} ';

    switch (pattern.type) {
      case RecurrenceType.daily:
        final skip = pattern.skipWeekends ? ' (weekdays)' : '';
        return 'Every $interval${pattern.interval == 1 ? 'day' : 'days'}$skip';
      case RecurrenceType.weekly:
        if (pattern.daysOfWeek != null && pattern.daysOfWeek!.isNotEmpty) {
          final days = pattern.daysOfWeek!
              .split(',')
              .map((e) => int.parse(e.trim()))
              .map((d) => ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][d])
              .join(', ');
          return 'Every $interval${pattern.interval == 1 ? 'week' : 'weeks'} on $days';
        }
        return 'Weekly';
      case RecurrenceType.monthly:
        if (pattern.lastDayOfMonth == true) {
          return 'Monthly on the last day';
        }
        if (pattern.daysOfMonth != null && pattern.daysOfMonth!.isNotEmpty) {
          final days = pattern.daysOfMonth!;
          return 'Monthly on day $days';
        }
        return 'Monthly';
      case RecurrenceType.yearly:
        return 'Yearly';
      default:
        return 'Custom';
    }
  }

  void _navigateToRecurringForm(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TaskFormPage()),
    );
  }

  void _showTemplateOptions(
    BuildContext context,
    WidgetRef ref,
    TodoTask template,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Template'),
              onTap: () {
                Navigator.pop(context);
                _editTemplate(context, template);
              },
            ),
            ListTile(
              leading: const Icon(Icons.visibility),
              title: const Text('View All Instances'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to instances list
              },
            ),
            ListTile(
              leading: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.error,
              ),
              title: Text(
                'Delete Series',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
              onTap: () {
                Navigator.pop(context);
                _confirmDeleteSeries(context, ref, template);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _editTemplate(BuildContext context, TodoTask template) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TaskFormPage(task: template)),
    );
  }

  void _confirmDeleteSeries(
    BuildContext context,
    WidgetRef ref,
    TodoTask template,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Recurring Task?'),
        content: Text(
          'This will delete "${template.title}" and all its future occurrences. This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              if (template.recurringSeriesId != null) {
                final delete = ref.read(deleteRecurringSeriesProvider);
                await delete(template.recurringSeriesId!);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Recurring task deleted')),
                  );
                }
              }
            },
            child: Text(
              'Delete',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _completeInstance(WidgetRef ref, TodoTask instance) async {
    final todoRepo = ref.read(todoRepositoryProvider);
    await todoRepo.completeTodo(instance.id);
  }

  Future<void> _skipInstance(WidgetRef ref, TodoTask instance) async {
    final skip = ref.read(skipRecurringInstanceProvider);
    await skip(instance.id);
  }
}
