import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  bool _exactAlarmGranted = false;
  int _pendingNotifications = 0;

  @override
  void initState() {
    super.initState();
    _checkPermissions();
    _loadPendingNotifications();
  }

  Future<void> _checkPermissions() async {
    final notificationService = NotificationService();
    final granted = await notificationService.areNotificationsEnabled();
    final exactAlarmGranted = await notificationService.canScheduleExactAlarms();

    if (mounted) {
      setState(() {
        _permissionGranted = granted;
        _exactAlarmGranted = exactAlarmGranted;
      });

      debugPrint('📋 [SETTINGS] Permission check:');
      debugPrint('   Notifications: $_permissionGranted');
      debugPrint('   Exact alarms: $_exactAlarmGranted');
    }
  }

  Future<void> _loadPendingNotifications() async {
    final pending = await NotificationService().getPendingNotifications();
    if (mounted) {
      setState(() {
        _pendingNotifications = pending.length;
      });
      debugPrint('📋 [SETTINGS] Pending notifications: $_pendingNotifications');
      debugPrint('   Current time: ${DateTime.now()}');
      for (final notification in pending) {
        debugPrint('   - ID ${notification.id}: ${notification.title}');
        if (notification.payload != null) {
          debugPrint('     Payload: ${notification.payload}');
        }
        debugPrint('     Body: ${notification.body}');
      }
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

          // Diagnostic section
          if (_permissionGranted) ...[
            const Divider(),
            const SizedBox(height: 8),
            ListTile(
              title: const Text('Diagnostic Info'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        _exactAlarmGranted ? Icons.check_circle : Icons.error,
                        size: 16,
                        color: _exactAlarmGranted ? Colors.green : Colors.red,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Exact Alarms: ${_exactAlarmGranted ? 'Granted' : 'NOT Granted'}',
                        style: TextStyle(
                          color: _exactAlarmGranted ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text('Pending notifications: $_pendingNotifications'),
                ],
              ),
            ),

            // Exact alarm permission button
            if (!_exactAlarmGranted)
              Card(
                color: Theme.of(context).colorScheme.errorContainer,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.alarm_off,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Scheduled Notifications Disabled',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Your device requires "Alarms & reminders" permission for scheduled notifications to work.',
                      ),
                      const SizedBox(height: 12),
                      FilledButton.icon(
                        onPressed: _requestExactAlarmPermission,
                        icon: const Icon(Icons.settings),
                        label: const Text('Enable in Settings'),
                      ),
                    ],
                  ),
                ),
              ),
          ],

          const SizedBox(height: 16),

          // Test notification button
          if (_permissionGranted && preferences.notificationsEnabled) ...[
            OutlinedButton.icon(
              onPressed: _sendTestNotification,
              icon: const Icon(Icons.notifications_active),
              label: const Text('Send Test Notification'),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: _refreshDiagnostics,
              icon: const Icon(Icons.refresh),
              label: const Text('Refresh Diagnostics'),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: _clearTestNotifications,
              icon: const Icon(Icons.clear_all),
              label: const Text('Clear Test Notifications'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _refreshDiagnostics() async {
    await _checkPermissions();
    await _loadPendingNotifications();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Diagnostics refreshed')),
      );
    }
  }

  Future<void> _requestExactAlarmPermission() async {
    final granted = await NotificationService().requestExactAlarmPermission();
    await _checkPermissions();

    if (mounted) {
      if (granted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Exact alarm permission granted!'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Please enable "Alarms & reminders" in the settings that just opened',
            ),
          ),
        );
      }
    }
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
    try {
      await NotificationService().showTestNotification();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Test notification sent!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error sending notification: $e')),
        );
      }
    }
  }

  Future<void> _clearTestNotifications() async {
    try {
      await NotificationService().cancelTestNotifications();
      await _loadPendingNotifications();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Test notifications cleared'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error clearing notifications: $e')),
        );
      }
    }
  }
}
