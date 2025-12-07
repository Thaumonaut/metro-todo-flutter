import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../data/models/recurring_pattern.dart';

/// Widget for selecting and configuring a recurrence pattern
class RecurrencePatternSelector extends StatefulWidget {
  final bool isRecurring;
  final RecurringPattern? pattern;
  final DateTime? startDate;
  final Function(bool isRecurring, RecurringPattern? pattern) onChanged;

  const RecurrencePatternSelector({
    super.key,
    required this.isRecurring,
    this.pattern,
    this.startDate,
    required this.onChanged,
  });

  @override
  State<RecurrencePatternSelector> createState() => _RecurrencePatternSelectorState();
}

class _RecurrencePatternSelectorState extends State<RecurrencePatternSelector> {
  late bool _isRecurring;
  late RecurrenceType _type;
  late int _interval;
  late List<int> _daysOfWeek;
  late List<int> _daysOfMonth;
  late bool _lastDayOfMonth;
  late bool _skipWeekends;
  DateTime? _endDate;
  int? _maxOccurrences;
  late int _endType; // 0 = never, 1 = date, 2 = occurrences

  @override
  void initState() {
    super.initState();
    _initFromPattern(widget.pattern);
  }

  void _initFromPattern(RecurringPattern? pattern) {
    _isRecurring = widget.isRecurring;
    _type = pattern?.type ?? RecurrenceType.weekly;
    _interval = pattern?.interval ?? 1;
    _daysOfWeek = pattern?.daysOfWeek ?? [DateTime.now().weekday - 1];
    _daysOfMonth = pattern?.daysOfMonth ?? [DateTime.now().day];
    _lastDayOfMonth = pattern?.lastDayOfMonth ?? false;
    _skipWeekends = pattern?.skipWeekends ?? false;
    _endDate = pattern?.endDate;
    _maxOccurrences = pattern?.maxOccurrences;

    if (_endDate != null) {
      _endType = 1;
    } else if (_maxOccurrences != null) {
      _endType = 2;
    } else {
      _endType = 0;
    }
  }

  void _notifyChange() {
    if (!_isRecurring) {
      widget.onChanged(false, null);
      return;
    }

    final pattern = RecurringPattern()
      ..type = _type
      ..interval = _interval
      ..daysOfWeek = _type == RecurrenceType.weekly ? _daysOfWeek : null
      ..daysOfMonth = _type == RecurrenceType.monthly && !_lastDayOfMonth ? _daysOfMonth : null
      ..lastDayOfMonth = _type == RecurrenceType.monthly ? _lastDayOfMonth : null
      ..skipWeekends = _skipWeekends
      ..endDate = _endType == 1 ? _endDate : null
      ..maxOccurrences = _endType == 2 ? _maxOccurrences : null;

    widget.onChanged(true, pattern);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Toggle for recurring
        SwitchListTile(
          title: const Text('Repeat'),
          subtitle: _isRecurring ? Text(_getPatternSummary()) : null,
          value: _isRecurring,
          onChanged: (value) {
            setState(() {
              _isRecurring = value;
            });
            _notifyChange();
          },
          contentPadding: EdgeInsets.zero,
        ),

        if (_isRecurring) ...[
          const SizedBox(height: 16),

          // Pattern type selector
          Text(
            'Repeat',
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          SegmentedButton<RecurrenceType>(
            segments: const [
              ButtonSegment(value: RecurrenceType.daily, label: Text('Daily')),
              ButtonSegment(value: RecurrenceType.weekly, label: Text('Weekly')),
              ButtonSegment(value: RecurrenceType.monthly, label: Text('Monthly')),
              ButtonSegment(value: RecurrenceType.yearly, label: Text('Yearly')),
            ],
            selected: {_type},
            onSelectionChanged: (Set<RecurrenceType> selection) {
              setState(() {
                _type = selection.first;
              });
              _notifyChange();
            },
          ),
          const SizedBox(height: 16),

          // Interval selector
          Row(
            children: [
              Text('Every ', style: theme.textTheme.bodyLarge),
              SizedBox(
                width: 80,
                child: DropdownButtonFormField<int>(
                  initialValue: _interval,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  items: List.generate(30, (i) => i + 1)
                      .map((i) => DropdownMenuItem(value: i, child: Text('$i')))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _interval = value ?? 1;
                    });
                    _notifyChange();
                  },
                ),
              ),
              const SizedBox(width: 8),
              Text(_getIntervalLabel(), style: theme.textTheme.bodyLarge),
            ],
          ),
          const SizedBox(height: 16),

          // Type-specific options
          ..._buildTypeSpecificOptions(),

          const SizedBox(height: 16),

          // Skip weekends
          if (_type == RecurrenceType.daily)
            CheckboxListTile(
              title: const Text('Skip weekends'),
              value: _skipWeekends,
              onChanged: (value) {
                setState(() {
                  _skipWeekends = value ?? false;
                });
                _notifyChange();
              },
              contentPadding: EdgeInsets.zero,
            ),

          // End condition
          const SizedBox(height: 8),
          Text(
            'Ends',
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          _buildEndConditionSelector(),

          // Preview
          const SizedBox(height: 24),
          Text(
            'Next occurrences',
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          _buildPreview(),
        ],
      ],
    );
  }

  List<Widget> _buildTypeSpecificOptions() {
    switch (_type) {
      case RecurrenceType.weekly:
        return [_buildDaysOfWeekSelector()];
      case RecurrenceType.monthly:
        return [_buildMonthlyOptions()];
      case RecurrenceType.yearly:
        return [_buildYearlyInfo()];
      default:
        return [];
    }
  }

  Widget _buildDaysOfWeekSelector() {
    final dayNames = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('On', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: List.generate(7, (index) {
            final isSelected = _daysOfWeek.contains(index);
            return FilterChip(
              label: Text(dayNames[index]),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _daysOfWeek.add(index);
                  } else {
                    _daysOfWeek.remove(index);
                  }
                  _daysOfWeek.sort();
                });
                _notifyChange();
              },
            );
          }),
        ),
      ],
    );
  }

  Widget _buildMonthlyOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxListTile(
          title: const Text('Last day of month'),
          value: _lastDayOfMonth,
          onChanged: (value) {
            setState(() {
              _lastDayOfMonth = value ?? false;
            });
            _notifyChange();
          },
          contentPadding: EdgeInsets.zero,
        ),
        if (!_lastDayOfMonth) ...[
          Text('On day', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 8),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: List.generate(31, (index) {
              final day = index + 1;
              final isSelected = _daysOfMonth.contains(day);
              return FilterChip(
                label: Text('$day'),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _daysOfMonth.add(day);
                    } else {
                      _daysOfMonth.remove(day);
                    }
                    _daysOfMonth.sort();
                  });
                  _notifyChange();
                },
                visualDensity: VisualDensity.compact,
              );
            }),
          ),
        ],
      ],
    );
  }

  Widget _buildYearlyInfo() {
    final startDate = widget.startDate ?? DateTime.now();
    final monthName = DateFormat('MMMM').format(startDate);

    return Text(
      'On $monthName ${startDate.day}',
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }

  Widget _buildEndConditionSelector() {
    return Column(
      children: [
        // Never option
        RadioListTile<int>(
          title: const Text('Never'),
          value: 0,
          groupValue: _endType,
          onChanged: (value) {
            setState(() {
              _endType = value ?? 0;
              _endDate = null;
              _maxOccurrences = null;
            });
            _notifyChange();
          },
          contentPadding: EdgeInsets.zero,
        ),
        // End on date option
        RadioListTile<int>(
          title: const Text('On date'),
          subtitle: _endType == 1 && _endDate != null
              ? Text(DateFormat('MMM d, yyyy').format(_endDate!))
              : null,
          value: 1,
          groupValue: _endType,
          onChanged: (value) {
            setState(() {
              _endType = value ?? 1;
              _maxOccurrences = null;
            });
            if (_endDate == null) {
              _selectEndDate();
            }
            _notifyChange();
          },
          secondary: _endType == 1
              ? IconButton(
                  icon: const Icon(Icons.edit_calendar),
                  onPressed: _selectEndDate,
                )
              : null,
          contentPadding: EdgeInsets.zero,
        ),
        // After occurrences option
        RadioListTile<int>(
          title: Text('After ${_maxOccurrences ?? 10} occurrences'),
          value: 2,
          groupValue: _endType,
          onChanged: (value) {
            setState(() {
              _endType = value ?? 2;
              _maxOccurrences ??= 10;
              _endDate = null;
            });
            _notifyChange();
          },
          secondary: _endType == 2
              ? PopupMenuButton<int>(
                  icon: const Icon(Icons.edit),
                  onSelected: (value) {
                    setState(() {
                      _maxOccurrences = value;
                    });
                    _notifyChange();
                  },
                  itemBuilder: (context) => [5, 10, 20, 30, 50, 100]
                      .map((i) => PopupMenuItem(value: i, child: Text('$i')))
                      .toList(),
                )
              : null,
          contentPadding: EdgeInsets.zero,
        ),
      ],
    );
  }

  Future<void> _selectEndDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _endDate ?? DateTime.now().add(const Duration(days: 90)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );
    if (date != null) {
      setState(() {
        _endDate = date;
      });
      _notifyChange();
    }
  }

  Widget _buildPreview() {
    if (!_isRecurring) {
      return const Text('No recurrence set');
    }

    // Build a temporary pattern to calculate occurrences
    final pattern = RecurringPattern()
      ..type = _type
      ..interval = _interval
      ..daysOfWeek = _type == RecurrenceType.weekly ? _daysOfWeek : null
      ..daysOfMonth = _type == RecurrenceType.monthly && !_lastDayOfMonth ? _daysOfMonth : null
      ..lastDayOfMonth = _type == RecurrenceType.monthly ? _lastDayOfMonth : null
      ..skipWeekends = _skipWeekends
      ..endDate = _endType == 1 ? _endDate : null
      ..maxOccurrences = _endType == 2 ? _maxOccurrences : null;

    // Simple preview calculation (first 5)
    final startDate = widget.startDate ?? DateTime.now();
    final previewDates = _calculatePreviewDates(pattern, startDate, 5);

    if (previewDates.isEmpty) {
      return const Text('No upcoming occurrences');
    }

    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: previewDates.map((date) {
        return Chip(
          label: Text(DateFormat('MMM d').format(date)),
          visualDensity: VisualDensity.compact,
        );
      }).toList(),
    );
  }

  List<DateTime> _calculatePreviewDates(RecurringPattern pattern, DateTime start, int count) {
    final dates = <DateTime>[];
    var current = start;

    for (var i = 0; i < count && i < 100; i++) {
      dates.add(current);
      final next = _getNextOccurrence(pattern, current);
      if (next == null) break;
      current = next;
    }

    return dates;
  }

  DateTime? _getNextOccurrence(RecurringPattern pattern, DateTime after) {
    switch (pattern.type) {
      case RecurrenceType.daily:
        return after.add(Duration(days: pattern.interval));
      case RecurrenceType.weekly:
        return after.add(Duration(days: 7 * pattern.interval));
      case RecurrenceType.monthly:
        return DateTime(after.year, after.month + pattern.interval, after.day);
      case RecurrenceType.yearly:
        return DateTime(after.year + pattern.interval, after.month, after.day);
      default:
        return null;
    }
  }

  String _getPatternSummary() {
    final interval = _interval == 1 ? '' : '$_interval ';

    switch (_type) {
      case RecurrenceType.daily:
        final skip = _skipWeekends ? ' (weekdays)' : '';
        return 'Every $interval${_interval == 1 ? 'day' : 'days'}$skip';
      case RecurrenceType.weekly:
        final days = _daysOfWeek.map((d) => ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][d]).join(', ');
        return 'Every $interval${_interval == 1 ? 'week' : 'weeks'} on $days';
      case RecurrenceType.monthly:
        if (_lastDayOfMonth) {
          return 'Monthly on the last day';
        }
        final days = _daysOfMonth.join(', ');
        return 'Monthly on day $days';
      case RecurrenceType.yearly:
        return 'Yearly';
      default:
        return 'Custom';
    }
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
      default:
        return '';
    }
  }
}
