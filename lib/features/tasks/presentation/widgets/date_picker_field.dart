import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/metro_button.dart';

/// Custom date and time picker field with Metro styling
class DateTimeSelectionField extends StatelessWidget {
  const DateTimeSelectionField({
    super.key,
    required this.label,
    required this.selectedDateTime,
    required this.onDateTimeSelected,
    this.firstDate,
    this.lastDate,
    this.includeTime = false,
  });

  final String label;
  final DateTime? selectedDateTime;
  final ValueChanged<DateTime?> onDateTimeSelected;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final bool includeTime;

  @override
  Widget build(BuildContext context) {
    // Format: "Oct 24, 2023" or "Oct 24, 2023 at 5:30 PM"
    final dateFormat = DateFormat('MMM dd, yyyy');
    final timeFormat = DateFormat('h:mm a');

    String displayText = 'Select date';
    if (selectedDateTime != null) {
      displayText = dateFormat.format(selectedDateTime!);
      if (includeTime) {
        displayText += ' at ${timeFormat.format(selectedDateTime!)}';
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.body2.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () => _pickDateTime(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline,
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  includeTime && selectedDateTime != null
                      ? Icons.notifications_active
                      : Icons.calendar_today,
                  size: 20,
                  color: selectedDateTime != null
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(
                          context,
                        ).colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    displayText,
                    style: AppTypography.body1.copyWith(
                      color: selectedDateTime != null
                          ? Theme.of(context).colorScheme.onSurface
                          : Theme.of(context).colorScheme.onSurfaceVariant
                                .withValues(alpha: 0.6),
                    ),
                  ),
                ),
                if (selectedDateTime != null)
                  GestureDetector(
                    onTap: () => onDateTimeSelected(null),
                    child: Icon(
                      Icons.clear,
                      size: 20,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickDateTime(BuildContext context) async {
    final now = DateTime.now();
    final initial = selectedDateTime ?? now;

    // 1. Pick Date
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: firstDate ?? DateTime(2020),
      lastDate: lastDate ?? DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(
            context,
          ).copyWith(colorScheme: Theme.of(context).colorScheme),
          child: child!,
        );
      },
    );

    if (pickedDate == null) return;

    // 2. Pick Time (Optional)
    TimeOfDay? pickedTime;
    if (includeTime) {
      if (!context.mounted) return;

      pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initial),
        builder: (context, child) {
          return Theme(
            data: Theme.of(
              context,
            ).copyWith(colorScheme: Theme.of(context).colorScheme),
            child: child!,
          );
        },
      );

      if (pickedTime == null) {
        return; // User cancelled time selection, keep full cancel or just date?
      }
      // Typically if they cancel time, we might assume they want to cancel everything or just set date.
      // Let's assume they want to complete the flow. If they cancel time, we return early (do nothing).
      // Or we could default to midnight or current time?
      // Let's enforce picking time if includeTime is true.
    }

    // 3. Combine
    if (includeTime && pickedTime != null) {
      onDateTimeSelected(
        DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        ),
      );
    } else {
      // Date only - set to start of day or keep existing time?
      // Usually "Date Only" implies time is irrelevant or 00:00.
      // But if we are just switching modes...
      // The old logic was just date. Let's keep it 00:00 for date-only fields or preserve passed logic.
      // Actually standard DateTime(y,m,d) makes time 00:00.
      onDateTimeSelected(
        DateTime(pickedDate.year, pickedDate.month, pickedDate.day),
      );
    }
  }
}
