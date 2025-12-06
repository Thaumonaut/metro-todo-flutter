import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../../../core/providers/preferences_providers.dart';
import '../../../../data/services/notification_service.dart';

/// Notification settings page for configuring task reminders
class NotificationSettingsPage extends ConsumerStatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  ConsumerState<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState
    extends ConsumerState<NotificationSettingsPage> {
  bool _permissionGranted = false;

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  Future<void> _checkPermission() async {
    final granted = await NotificationService().areNotificationsEnabled();
    if (mounted) {
      setState(() {
        _permissionGranted = granted;
      });
    }
  }

  Future<void> _requestPermission() async {
    final granted = await NotificationService().requestPermissions();
    if (mounted) {
      setState(() {
        _permissionGranted = granted;
      });
      if (!granted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Notification permission denied'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final preferences = ref.watch(appPreferencesProvider);
    final preferencesNotifier = ref.read(appPreferencesProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Permission status card
          if (!_permissionGranted)
            Card(
              color: Theme.of(context).colorScheme.errorContainer,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.warning_rounded,
                          color: Theme.of(context).colorScheme.error,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Notifications Disabled',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Enable notifications to receive task reminders.',
                    ),
                    const SizedBox(height: 12),
                    FilledButton(
                      onPressed: _requestPermission,
                      child: const Text('Enable Notifications'),
                    ),
                  ],
                ),
              ),
            ),

          if (_permissionGranted) ...[
            // Master toggle
            SwitchListTile(
              title: const Text('Enable Notifications'),
              subtitle: const Text('Receive task reminders and alerts'),
              value: preferences.notificationsEnabled,
              onChanged: (value) {
                preferencesNotifier.setNotificationsEnabled(value);
              },
            ),
            const Divider(),

            // Due date notifications
            SwitchListTile(
              title: const Text('Due Date Reminders'),
              subtitle: const Text('Get notified about tasks due today'),
              value: preferences.dueDateReminders,
              onChanged: preferences.notificationsEnabled
                  ? (value) {
                      preferencesNotifier.setDueDateReminders(value);
                    }
                  : null,
            ),

            // Overdue notifications
            SwitchListTile(
              title: const Text('Overdue Alerts'),
              subtitle: const Text('Get notified when tasks become overdue'),
              value: preferences.overdueReminders,
              onChanged: preferences.notificationsEnabled
                  ? (value) {
                      preferencesNotifier.setOverdueReminders(value);
                    }
                  : null,
            ),

            // Upcoming notifications
            SwitchListTile(
              title: const Text('Upcoming Task Reminders'),
              subtitle: const Text('Get reminded before tasks are due'),
              value: preferences.upcomingReminders,
              onChanged: preferences.notificationsEnabled
                  ? (value) {
                      preferencesNotifier.setUpcomingReminders(value);
                    }
                  : null,
            ),

            const Divider(),
            const SizedBox(height: 8),

            // Reminder time selector
            ListTile(
              title: const Text('Reminder Time Before Due'),
              subtitle: Text(
                _formatReminderTime(preferences.reminderHoursBefore),
              ),
              trailing: const Icon(Icons.chevron_right),
              enabled: preferences.notificationsEnabled &&
                  preferences.upcomingReminders,
              onTap: () => _showReminderTimePicker(context, preferencesNotifier),
            ),
          ],

          const SizedBox(height: 24),

          // Test notification button
          if (_permissionGranted && preferences.notificationsEnabled)
            OutlinedButton.icon(
              onPressed: _sendTestNotification,
              icon: const Icon(Icons.notifications_active),
              label: const Text('Send Test Notification'),
            ),
        ],
      ),
    );
  }

  String _formatReminderTime(int hours) {
    if (hours >= 24) {
      final days = hours ~/ 24;
      return '$days day${days > 1 ? 's' : ''} before';
    } else {
      return '$hours hour${hours > 1 ? 's' : ''} before';
    }
  }

  void _showReminderTimePicker(
    BuildContext context,
    AppPreferencesNotifier notifier,
  ) {
    final options = [
      (1, '1 hour'),
      (2, '2 hours'),
      (4, '4 hours'),
      (8, '8 hours'),
      (12, '12 hours'),
      (24, '1 day'),
      (48, '2 days'),
    ];

    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Reminder Time'),
        children: options.map((option) {
          return SimpleDialogOption(
            onPressed: () {
              notifier.setReminderHoursBefore(option.$1);
              Navigator.pop(context);
            },
            child: Text(option.$2),
          );
        }).toList(),
      ),
    );
  }

  Future<void> _sendTestNotification() async {
    final notifications = FlutterLocalNotificationsPlugin();
    await notifications.show(
      999999,
      'Test Notification',
      'This is a test notification from Metro Todo',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'test',
          'Test Notifications',
          channelDescription: 'Test notification channel',
        ),
        linux: LinuxNotificationDetails(),
      ),
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Test notification sent!')),
      );
    }
  }
}
