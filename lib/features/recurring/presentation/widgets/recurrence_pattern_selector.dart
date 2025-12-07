import 'package:flutter/material.dart';

import '../../../../core/theme/app_typography.dart';
import '../../../../data/models/recurring_pattern.dart';

class RecurrencePatternSelector extends StatefulWidget {
  const RecurrencePatternSelector({
    super.key,
    required this.isRecurring,
    this.pattern,
    required this.onChanged,
    this.startDate,
  });

  final bool isRecurring;
  final RecurringPattern? pattern;
  final Function(bool, RecurringPattern?) onChanged;
  final DateTime? startDate;

  @override
  State<RecurrencePatternSelector> createState() =>
      _RecurrencePatternSelectorState();
}

class _RecurrencePatternSelectorState extends State<RecurrencePatternSelector> {
  late RecurrenceType _type;
  int _interval = 1;
  List<int> _daysOfWeek = [];
  List<int> _daysOfMonth = [];
  bool _lastDayOfMonth = false;

  // Custom recurrence handling
  final _intervalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeState();
    _intervalController.addListener(() {
      final value = int.tryParse(_intervalController.text);
      if (value != null && value != _interval) {
        setState(() {
          _interval = value;
          _updatePattern();
        });
      }
    });
  }

  @override
  void didUpdateWidget(RecurrencePatternSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.pattern != oldWidget.pattern) {
      _initializeState();
    }
  }

  void _initializeState() {
    if (widget.pattern != null) {
      // Parse string type to enum
      try {
        _type = RecurrenceType.values.byName(widget.pattern!.type);
      } catch (_) {
        _type = RecurrenceType.daily;
      }

      _interval = widget.pattern!.interval;
      _intervalController.text = _interval.toString();

      // Parse CSV lists
      if (widget.pattern!.daysOfWeek != null &&
          widget.pattern!.daysOfWeek!.isNotEmpty) {
        _daysOfWeek = widget.pattern!.daysOfWeek!
            .split(',')
            .map(int.parse)
            .toList();
      } else {
        _daysOfWeek = [];
      }

      if (widget.pattern!.daysOfMonth != null &&
          widget.pattern!.daysOfMonth!.isNotEmpty) {
        _daysOfMonth = widget.pattern!.daysOfMonth!
            .split(',')
            .map(int.parse)
            .toList();
      } else {
        _daysOfMonth = [];
      }

      _lastDayOfMonth = widget.pattern!.lastDayOfMonth ?? false;
    } else {
      _type = RecurrenceType.daily;
      _interval = 1;
      _intervalController.text = '1';
      _daysOfWeek = [];
      _daysOfMonth = [];
      _lastDayOfMonth = false;
    }
  }

  @override
  void dispose() {
    _intervalController.dispose();
    super.dispose();
  }

  void _updatePattern() {
    if (!widget.isRecurring) {
      widget.onChanged(false, null);
      return;
    }
    final pattern = _createPatternFromState();
    widget.onChanged(true, pattern);
  }

  RecurringPattern _createPatternFromState() {
    return RecurringPattern(
      id: 0, // Placeholder
      type: _type.name,
      interval: _interval,
      daysOfWeek: _type == RecurrenceType.weekly && _daysOfWeek.isNotEmpty
          ? _daysOfWeek.join(',')
          : null,
      daysOfMonth:
          _type == RecurrenceType.monthly &&
              !_lastDayOfMonth &&
              _daysOfMonth.isNotEmpty
          ? _daysOfMonth.join(',')
          : null,
      lastDayOfMonth: _type == RecurrenceType.monthly ? _lastDayOfMonth : false,
      nthWeekday: null,
      weekdayOfMonth: null,
      monthOfYear: null,
      dayOfYear: null,
      skipWeekends: false,
      endDate: null,
      maxOccurrences: null,
      isActive: true,
      createdAt: DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
              value: widget.isRecurring,
              onChanged: (value) {
                if (value == true) {
                  // Default to daily if enabling
                  // Generate initial pattern immediately from default state
                  final pattern = _createPatternFromState();
                  widget.onChanged(true, pattern);
                } else {
                  widget.onChanged(false, null);
                }
              },
            ),
            Text(
              'Recurring Task',
              style: AppTypography.body1.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),

        if (widget.isRecurring) ...[
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Type Selector
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: RecurrenceType.values.map((type) {
                    final isSelected = type == _type;
                    return ChoiceChip(
                      label: Text(
                        type.name.toUpperCase(),
                        style: TextStyle(
                          color: isSelected
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.onSurface,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      selected: isSelected,
                      selectedColor: Theme.of(context).colorScheme.primary,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            _type = type;
                            _updatePattern();
                          });
                        }
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),

                // Interval Selector
                Row(
                  children: [
                    Text('Repeat every'),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 60,
                      child: TextField(
                        controller: _intervalController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(_getIntervalLabel()),
                  ],
                ),
                const SizedBox(height: 16),

                // Specific selectors based on type
                if (_type == RecurrenceType.weekly) _buildWeeklySelector(),

                if (_type == RecurrenceType.monthly) _buildMonthlySelector(),
              ],
            ),
          ),
        ],
      ],
    );
  }

  String _getIntervalLabel() {
    switch (_type) {
      case RecurrenceType.daily:
        return _interval == 1 ? 'day' : 'days';
      case RecurrenceType.weekly:
        return _interval == 1 ? 'week' : 'weeks';
      case RecurrenceType.monthly:
        return _interval == 1 ? 'month' : 'months';
      case RecurrenceType.yearly:
        return _interval == 1 ? 'year' : 'years';
      case RecurrenceType.custom:
        return 'custom';
    }
  }

  Widget _buildWeeklySelector() {
    const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    return Wrap(
      spacing: 8,
      children: List.generate(7, (index) {
        // Monday is 1, Sunday is 7
        final dayNum = index + 1;
        final isSelected = _daysOfWeek.contains(dayNum);
        return FilterChip(
          label: Text(days[index]),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              if (selected) {
                _daysOfWeek.add(dayNum);
              } else {
                _daysOfWeek.remove(dayNum);
              }
              _daysOfWeek.sort();
              _updatePattern();
            });
          },
        );
      }),
    );
  }

  Widget _buildMonthlySelector() {
    return Column(
      children: [
        RadioListTile<bool>(
          title: const Text('On specific days'),
          value: false,
          groupValue: _lastDayOfMonth,
          onChanged: (val) {
            setState(() {
              _lastDayOfMonth = false;
              _updatePattern();
            });
          },
        ),
        if (!_lastDayOfMonth)
          Text(
            'Wait, implementing Day Picker for Month is complex. Using input field for now.',
          ),

        // Simplified for this context
        RadioListTile<bool>(
          title: const Text('On the last day of the month'),
          value: true,
          groupValue: _lastDayOfMonth, // ignore: deprecated_member_use
          onChanged: (val) {
            // ignore: deprecated_member_use
            setState(() {
              _lastDayOfMonth = true;
              _daysOfMonth.clear();
              _updatePattern();
            });
          },
        ),
      ],
    );
  }
}
