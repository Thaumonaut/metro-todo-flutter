import 'package:workmanager/workmanager.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/todo_task.dart';
import '../models/recurring_pattern.dart';
import '../models/task_tag.dart';
import 'recurrence_service.dart';

/// Background task identifiers
const String recurringTaskGenerationTask = 'recurringTaskGeneration';
const String dailyTaskCheckTask = 'dailyTaskCheck';

/// Callback dispatcher for workmanager - must be top-level function
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    try {
      switch (task) {
        case recurringTaskGenerationTask:
          await _generateRecurringInstances();
          break;
        case dailyTaskCheckTask:
          await _performDailyTaskCheck();
          break;
        default:
          return false;
      }
      return true;
    } catch (e) {
      print('Background task error: $e');
      return false;
    }
  });
}

/// Generate missing recurring task instances
Future<void> _generateRecurringInstances() async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [TodoTaskSchema, RecurringPatternSchema, TaskTagSchema],
    directory: dir.path,
    name: 'todo_db',
  );

  try {
    final recurrenceService = RecurrenceService(isar);
    await recurrenceService.generateMissingInstances();
  } finally {
    await isar.close();
  }
}

/// Perform daily task maintenance
Future<void> _performDailyTaskCheck() async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [TodoTaskSchema, RecurringPatternSchema, TaskTagSchema],
    directory: dir.path,
    name: 'todo_db',
  );

  try {
    // Clean up old completed tasks (older than 90 days)
    final cutoffDate = DateTime.now().subtract(const Duration(days: 90));

    await isar.writeTxn(() async {
      final oldCompletedTasks = await isar.todoTasks
          .filter()
          .isCompletedEqualTo(true)
          .completedAtLessThan(cutoffDate)
          .findAll();

      for (final task in oldCompletedTasks) {
        await isar.todoTasks.delete(task.id);
      }
    });

    // Generate new recurring instances
    final recurrenceService = RecurrenceService(isar);
    await recurrenceService.generateMissingInstances();
  } finally {
    await isar.close();
  }
}

/// Service for managing background tasks
class BackgroundTaskService {
  static bool _isInitialized = false;

  /// Initialize the background task service
  static Future<void> initialize() async {
    if (_isInitialized) return;

    await Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: false,
    );

    _isInitialized = true;
  }

  /// Register periodic tasks for recurring task generation
  static Future<void> registerPeriodicTasks() async {
    if (!_isInitialized) {
      await initialize();
    }

    // Register recurring task generation (every 6 hours)
    await Workmanager().registerPeriodicTask(
      'recurring_task_generation',
      recurringTaskGenerationTask,
      frequency: const Duration(hours: 6),
      constraints: Constraints(
        networkType: NetworkType.not_required,
        requiresBatteryNotLow: true,
      ),
      existingWorkPolicy: ExistingWorkPolicy.keep,
    );

    // Register daily task check (every 24 hours)
    await Workmanager().registerPeriodicTask(
      'daily_task_check',
      dailyTaskCheckTask,
      frequency: const Duration(hours: 24),
      constraints: Constraints(
        networkType: NetworkType.not_required,
        requiresBatteryNotLow: true,
      ),
      existingWorkPolicy: ExistingWorkPolicy.keep,
    );
  }

  /// Run a one-time task to generate recurring instances
  static Future<void> runImmediateRecurringGeneration() async {
    if (!_isInitialized) {
      await initialize();
    }

    await Workmanager().registerOneOffTask(
      'immediate_recurring_generation',
      recurringTaskGenerationTask,
      constraints: Constraints(
        networkType: NetworkType.not_required,
      ),
    );
  }

  /// Cancel all background tasks
  static Future<void> cancelAllTasks() async {
    await Workmanager().cancelAll();
  }
}
