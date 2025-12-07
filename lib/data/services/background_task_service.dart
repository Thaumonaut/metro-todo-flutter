import 'package:workmanager/workmanager.dart';
import 'dart:developer' as developer;
import '../repositories/todo_repository.dart';
import 'database_service.dart';
import 'recurrence_service.dart';

/// Background task identifiers
const String recurringTaskGenerationTask = 'recurringTaskGeneration';
const String dailyTaskCheckTask = 'dailyTaskCheck';

/// Callback dispatcher for workmanager - must be top-level function
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    try {
      // Initialize database for this isolate
      await DatabaseService.initialize();

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
      developer.log('Background task error', error: e);
      return false;
    } finally {
      // Optional: Close DB if we want to be clean, but often kept open until isolate dies
      // await DatabaseService.close();
    }
  });
}

/// Generate missing recurring task instances
Future<void> _generateRecurringInstances() async {
  try {
    final db = DatabaseService.instance;
    final todoRepo = TodoRepository(db);
    final recurrenceService = RecurrenceService(db, todoRepo);
    await recurrenceService.generateMissingInstances();
  } catch (e) {
    developer.log('Error generating recurring instances', error: e);
    rethrow;
  }
}

/// Perform daily task maintenance
Future<void> _performDailyTaskCheck() async {
  try {
    final db = DatabaseService.instance;
    final todoRepo = TodoRepository(db);

    // Clean up old completed tasks (older than 90 days)
    // RecurrenceService might have this logic? Or TodoRepository?
    // TodoRepository has cleanupOldInstances.
    await todoRepo.cleanupOldInstances(daysToKeep: 90);

    // Generate new recurring instances
    final recurrenceService = RecurrenceService(db, todoRepo);
    await recurrenceService.generateMissingInstances();
  } catch (e) {
    developer.log('Error performing daily task check', error: e);
    rethrow;
  }
}

/// Service for managing background tasks
class BackgroundTaskService {
  static bool _isInitialized = false;

  /// Initialize the background task service
  static Future<void> initialize() async {
    if (_isInitialized) return;

    await Workmanager().initialize(callbackDispatcher, isInDebugMode: false);

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
      constraints: Constraints(networkType: NetworkType.not_required),
    );
  }

  /// Cancel all background tasks
  static Future<void> cancelAllTasks() async {
    await Workmanager().cancelAll();
  }
}
