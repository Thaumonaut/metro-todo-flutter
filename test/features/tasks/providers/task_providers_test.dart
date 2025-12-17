import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/data/repositories/todo_repository.dart';
import 'package:todo_project/features/tasks/providers/notification_providers.dart';
import 'package:todo_project/features/tasks/providers/task_providers.dart';
import 'package:todo_project/data/providers/repository_providers.dart';
import 'package:todo_project/data/models/todo_task.dart';
import 'package:todo_project/data/models/importance_level.dart';
import 'package:todo_project/data/models/task_status.dart';

@GenerateMocks([TodoRepository, TaskNotificationManager])
import 'task_providers_test.mocks.dart';

void main() {
  late MockTodoRepository mockTodoRepository;
  late MockTaskNotificationManager mockNotificationManager;
  late ProviderContainer container;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    mockNotificationManager = MockTaskNotificationManager();
    
    container = ProviderContainer(
      overrides: [
        todoRepositoryProvider.overrideWithValue(mockTodoRepository),
        taskNotificationManagerProvider.overrideWithValue(mockNotificationManager),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('Task Providers', () {
    test('createTaskProvider schedules notifications', () async {
      final task = TodoTask(
        id: 1,
        uuid: 'uuid-123',
        title: 'Test Task',
        importance: ImportanceLevel.medium.name,
        status: TaskStatus.notStarted.name,
        createdAt: DateTime.now(),
        isCompleted: false,
        isRecurring: false,
        isRecurringTemplate: false,
        isRecurringException: false,
        isSkipped: false,
        isDueToday: false,
        isOverdue: false,
      );

      // Mock createTodo to return ID 1
      when(mockTodoRepository.createTodo(
        title: anyNamed('title'),
        description: anyNamed('description'),
        importance: anyNamed('importance'),
        status: anyNamed('status'),
        dueDate: anyNamed('dueDate'),
        tagIds: anyNamed('tagIds'),
        reminders: anyNamed('reminders'),
      )).thenAnswer((_) async => 1);

      // Mock getTodoById to return the task
      when(mockTodoRepository.getTodoById(1)).thenAnswer((_) async => task);

      when(mockNotificationManager.scheduleTaskNotifications(any, customReminders: anyNamed('customReminders')))
          .thenAnswer((_) async {});

      final create = container.read(createTaskProvider);
      await create(
        title: 'Test Task',
        importance: ImportanceLevel.medium,
      );

      verify(mockTodoRepository.createTodo(
        title: 'Test Task',
        importance: ImportanceLevel.medium,
        status: TaskStatus.notStarted,
      )).called(1);
      
      verify(mockTodoRepository.getTodoById(1)).called(1);

      verify(mockNotificationManager.scheduleTaskNotifications(task, customReminders: null)).called(1);
    });

    test('updateTaskProvider schedules notifications', () async {
      final task = TodoTask(
        id: 1,
        uuid: 'uuid-456',
        title: 'Test Task',
        importance: ImportanceLevel.medium.name,
        status: TaskStatus.notStarted.name,
        createdAt: DateTime.now(),
        isCompleted: false,
        isRecurring: false,
        isRecurringTemplate: false,
        isRecurringException: false,
        isSkipped: false,
        isDueToday: false,
        isOverdue: false,
      );

      // Update signature matches new logic: ID-based update
      when(mockTodoRepository.updateTodo(
        any, // id
        title: anyNamed('title'),
        description: anyNamed('description'),
        importance: anyNamed('importance'),
        status: anyNamed('status'),
        dueDate: anyNamed('dueDate'),
        reminderDateTime: anyNamed('reminderDateTime'),
        isCompleted: anyNamed('isCompleted'),
        completedAt: anyNamed('completedAt'),
        isDueToday: anyNamed('isDueToday'),
        isOverdue: anyNamed('isOverdue'),
        reminders: anyNamed('reminders'),
      )).thenAnswer((_) async => true);

      when(mockNotificationManager.scheduleTaskNotifications(any, customReminders: anyNamed('customReminders')))
          .thenAnswer((_) async {});

      final update = container.read(updateTaskProvider);
      await update(task);

      verify(mockTodoRepository.updateTodo(
        task.id,
        title: task.title,
        description: task.description,
        importance: ImportanceLevel.values.firstWhere((e) => e.name == task.importance),
        status: TaskStatus.values.firstWhere((e) => e.name == task.status),
        // ... verify other fields if strictly needed, but ID is key
        dueDate: task.dueDate,
        reminderDateTime: task.reminderDateTime,
        isCompleted: task.isCompleted,
        completedAt: task.completedAt,
        isDueToday: task.isDueToday,
        isOverdue: task.isOverdue,
        reminders: null,
      )).called(1);

      verify(mockNotificationManager.scheduleTaskNotifications(task, customReminders: null)).called(1);
    });

    test('completeTaskProvider cancels notifications', () async {
      final task = TodoTask(
        id: 1,
        uuid: 'uuid-789',
        title: 'Test Task',
        importance: ImportanceLevel.medium.name,
        status: TaskStatus.notStarted.name,
        createdAt: DateTime.now(),
        isCompleted: false,
        isRecurring: false,
        isRecurringTemplate: false,
        isRecurringException: false,
        isSkipped: false,
        isDueToday: false,
        isOverdue: false,
      );

      when(mockTodoRepository.completeTodo(task.id)).thenAnswer((_) async => true);
      when(mockNotificationManager.cancelTaskNotifications(task.id))
          .thenAnswer((_) async {});

      final complete = container.read(completeTaskProvider);
      await complete(task);

      verify(mockTodoRepository.completeTodo(task.id)).called(1);
      verify(mockNotificationManager.cancelTaskNotifications(task.id))
          .called(1);
    });

    test('deleteTaskProvider cancels notifications if delete successful', () async {
      final task = TodoTask(
        id: 1,
        uuid: 'uuid-delete',
        title: 'Test Task',
        importance: ImportanceLevel.medium.name,
        status: TaskStatus.notStarted.name,
        createdAt: DateTime.now(),
        isCompleted: false,
        isRecurring: false,
        isRecurringTemplate: false,
        isRecurringException: false,
        isSkipped: false,
        isDueToday: false,
        isOverdue: false,
      );

      when(mockTodoRepository.deleteTodo(task.id)).thenAnswer((_) async => true);
      when(mockNotificationManager.cancelTaskNotifications(task.id))
          .thenAnswer((_) async {});

      final delete = container.read(deleteTaskProvider);
      await delete(task);

      verify(mockTodoRepository.deleteTodo(task.id)).called(1);
      verify(mockNotificationManager.cancelTaskNotifications(task.id))
          .called(1);
    });
    
    test('uncompleteTaskProvider schedules notifications', () async {
      final task = TodoTask(
        id: 1,
        uuid: 'uuid-uncomplete',
        title: 'Test Task',
        importance: ImportanceLevel.medium.name,
        status: TaskStatus.notStarted.name,
        createdAt: DateTime.now(),
        isCompleted: true,
        isRecurring: false,
        isRecurringTemplate: false,
        isRecurringException: false,
        isSkipped: false,
        isDueToday: false,
        isOverdue: false,
      );

      when(mockTodoRepository.uncompleteTodo(task.id)).thenAnswer((_) async => true);
      when(mockNotificationManager.scheduleTaskNotifications(task))
          .thenAnswer((_) async {});

      final uncomplete = container.read(uncompleteTaskProvider);
      await uncomplete(task);

      verify(mockTodoRepository.uncompleteTodo(task.id)).called(1);
      verify(mockNotificationManager.scheduleTaskNotifications(task))
          .called(1);
    });
  });
}
