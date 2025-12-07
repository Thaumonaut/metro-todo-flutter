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

@DriftDatabase(
  tables: [
    TodoTasks,
    TaskTags,
    TodoTaskTags,
    RecurringPatterns,
    RecurringCompletions,
    TaskReminders,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          // We added the reminderDateTime column in TodoTasks in step 1, but user crashed.
          // If they run this, they might have a DB v1.
          // The previous code added 'reminderDateTime' to TodoTasks table definition
          // but didn't run a migration. Now we are at v2.
          // We should add the 'reminderDateTime' column to TodoTasks if it's missing (to fix the crash if we keep it)
          // OR we remove it and strictly use TaskReminders.
          // Given the user wants multiple reminders, distinct table is better.
          // BUT, to avoid breaking any other code referencing 'reminderDateTime' on TodoTasks just yet,
          // let's add the column properly to fix the "no such column" error if we keep the field.
          // However, my plan is to switch to TaskReminders.
          // Let's check if I should keep 'reminderDateTime' as a computed "next reminder" or "primary reminder".
          // It's useful for sorting. Let's keep it and actually add it.
          await m.addColumn(todoTasks, todoTasks.reminderDateTime);

          // Add the new table
          await m.createTable(taskReminders);
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
