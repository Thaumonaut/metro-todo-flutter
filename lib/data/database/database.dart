import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class TodoTasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get importance => text()(); // Store Enum as String
  TextColumn get status => text()(); // Store Enum as String
  DateTimeColumn get dueDate => dateTime().nullable()();
  DateTimeColumn get reminderDateTime => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();

  // Computed fields in Isar are stored as normal columns here or computed on read
  // For simplicity and performance in queries, we'll store them if the repo logic expects to write them,
  // otherwise we can make them getters in the data class.
  // The repo logic explicitly writes isDueToday and isOverdue, so we'll store them.
  BoolColumn get isDueToday => boolean().withDefault(const Constant(false))();
  BoolColumn get isOverdue => boolean().withDefault(const Constant(false))();

  // Recurrence
  BoolColumn get isRecurring => boolean().withDefault(const Constant(false))();
  BoolColumn get isRecurringTemplate =>
      boolean().withDefault(const Constant(false))();
  IntColumn get recurringPatternId => integer().nullable()();
  TextColumn get recurringSeriesId => text().nullable()();
  DateTimeColumn get recurringOriginalDate => dateTime().nullable()();
  IntColumn get recurringInstanceNumber => integer().nullable()();
  BoolColumn get isRecurringException =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get isSkipped => boolean().withDefault(const Constant(false))();

  // Task type for special task handling
  TextColumn get taskType =>
      text().withDefault(const Constant('standard'))();
}

class TaskTags extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  IntColumn get colorValue => integer()();
  TextColumn get icon => text().nullable()();
}

class RecurringPatterns extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text()(); // EnumRecurrenceType
  IntColumn get interval => integer().withDefault(const Constant(1))();
  TextColumn get daysOfWeek =>
      text().nullable()(); // List<int> stored as JSON or comma-separated
  TextColumn get daysOfMonth =>
      text().nullable()(); // List<int> stored as JSON or comma-separated
  BoolColumn get lastDayOfMonth => boolean().nullable()();
  IntColumn get nthWeekday => integer().nullable()();
  IntColumn get weekdayOfMonth => integer().nullable()();
  IntColumn get monthOfYear => integer().nullable()();
  IntColumn get dayOfYear => integer().nullable()();
  BoolColumn get skipWeekends => boolean().withDefault(const Constant(false))();
  DateTimeColumn get endDate => dateTime().nullable()();
  IntColumn get maxOccurrences => integer().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get seriesId => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  TextColumn get customRule => text().nullable()();
}

class RecurringCompletions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get recurringSeriesId => text()();
  IntColumn get instanceNumber => integer()();
  DateTimeColumn get scheduledDate => dateTime()();
  DateTimeColumn get completedAt => dateTime()();
  TextColumn get note => text().nullable()();
  TextColumn get completedBy => text().nullable()();
}

class TodoTaskTags extends Table {
  IntColumn get taskId =>
      integer().references(TodoTasks, #id, onDelete: KeyAction.cascade)();
  IntColumn get tagId =>
      integer().references(TaskTags, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {taskId, tagId};
}

// Recurring Pattern/Completion tables can be added if needed, checking existing files...
// Based on file list, they exist. Let's add them or keep them pending.
// For now, sticking to what's used in TodoRepository.

class TaskReminders extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get taskId =>
      integer().references(TodoTasks, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get scheduledAt => dateTime()();
  BoolColumn get isSent => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// Special Task Types Tables

class Medications extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get taskId =>
      integer().references(TodoTasks, #id, onDelete: KeyAction.cascade)();

  // Core medication info
  TextColumn get medicationName => text()();
  TextColumn get dosage => text()();

  // Inventory tracking
  RealColumn get currentQuantity => real()();
  RealColumn get refillThreshold => real()();
  RealColumn get quantityPerDose =>
      real().withDefault(const Constant(1.0))();
  BoolColumn get autoDecrementEnabled =>
      boolean().withDefault(const Constant(true))();

  // Medical info
  TextColumn get prescribingDoctor => text().nullable()();
  TextColumn get pharmacyInfo => text().nullable()();
  TextColumn get prescriptionNumber => text().nullable()();
  TextColumn get instructions => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class MedicationInventoryLog extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get medicationId =>
      integer().references(Medications, #id, onDelete: KeyAction.cascade)();

  RealColumn get previousQuantity => real()();
  RealColumn get newQuantity => real()();
  RealColumn get changeAmount => real()();
  TextColumn get changeReason => text()();
  IntColumn get relatedTaskCompletionId => integer().nullable()();

  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
}

class TaskTriggers extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get sourceTaskId =>
      integer().references(TodoTasks, #id, onDelete: KeyAction.cascade)();

  // Trigger configuration
  TextColumn get triggerType => text()();
  TextColumn get triggerCondition => text()();

  // Template for task to create
  TextColumn get targetTaskTitle => text()();
  TextColumn get targetTaskDescription => text().nullable()();
  TextColumn get targetTaskType =>
      text().withDefault(const Constant('standard'))();
  TextColumn get targetImportance => text()();

  // Trigger state
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get lastTriggered => dateTime().nullable()();
  IntColumn get createdTaskId => integer().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class Habits extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get taskId =>
      integer().references(TodoTasks, #id, onDelete: KeyAction.cascade)();

  IntColumn get currentStreak => integer().withDefault(const Constant(0))();
  IntColumn get longestStreak => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastCompletedDate => dateTime().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class Bills extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get taskId =>
      integer().references(TodoTasks, #id, onDelete: KeyAction.cascade)();

  RealColumn get amount => real()();
  TextColumn get currency => text().withDefault(const Constant('USD'))();
  TextColumn get payee => text()();
  TextColumn get accountNumber => text().nullable()();
  TextColumn get paymentMethod => text().nullable()();

  BoolColumn get isPaid => boolean().withDefault(const Constant(false))();
  DateTimeColumn get paidAt => dateTime().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class Exercises extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get taskId =>
      integer().references(TodoTasks, #id, onDelete: KeyAction.cascade)();

  IntColumn get sets => integer().nullable()();
  IntColumn get reps => integer().nullable()();
  IntColumn get duration => integer().nullable()();
  TextColumn get workoutType => text().nullable()();
  TextColumn get notes => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class Chores extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get taskId =>
      integer().references(TodoTasks, #id, onDelete: KeyAction.cascade)();

  IntColumn get completionCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastCompletedAt => dateTime().nullable()();
  TextColumn get cleaningProducts => text().nullable()();
  TextColumn get notes => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class DaysSince extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get taskId =>
      integer().references(TodoTasks, #id, onDelete: KeyAction.cascade)();

  TextColumn get behaviorDescription => text()();
  DateTimeColumn get lastOccurrence => dateTime()();
  IntColumn get targetDaysGoal => integer().nullable()();
  IntColumn get longestStreak => integer().withDefault(const Constant(0))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(
  tables: [
    TodoTasks,
    TaskTags,
    TodoTaskTags,
    RecurringPatterns,
    RecurringCompletions,
    TaskReminders,
    Medications,
    MedicationInventoryLog,
    TaskTriggers,
    Habits,
    Bills,
    Exercises,
    Chores,
    DaysSince,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          // Migration from v1 to v2
          await m.addColumn(todoTasks, todoTasks.reminderDateTime);
          await m.createTable(taskReminders);
        }

        if (from < 3) {
          // Migration from v2 to v3: Add special task types support
          // Add taskType column to TodoTasks with default 'standard'
          await m.addColumn(todoTasks, todoTasks.taskType);

          // Create all special task type tables
          await m.createTable(medications);
          await m.createTable(medicationInventoryLog);
          await m.createTable(taskTriggers);
          await m.createTable(habits);
          await m.createTable(bills);
          await m.createTable(exercises);
          await m.createTable(chores);
          await m.createTable(daysSince);
        }
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
