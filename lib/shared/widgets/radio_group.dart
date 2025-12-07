import 'package:flutter/material.dart';

/// A custom radio group widget for Flutter
class LocalRadioGroup<T> extends StatelessWidget {
  final T value;
  final Function(T?) onChanged;
  final List<LocalRadioGroupItem<T>> items;

  const LocalRadioGroup({
    super.key,
    required this.value,
    required this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) {
        return LocalRadioGroupItem<T>(
          value: item.value,
          title: item.title,
          subtitle: item.subtitle,
          secondary: item.secondary,
          selected: value == item.value,
          onChanged: (bool? selected) {
            if (selected == true) {
              onChanged(item.value);
            }
          },
        );
      }).toList(),
    );
  }
}

/// An individual radio group item
class LocalRadioGroupItem<T> extends StatelessWidget {
  final T value;
  final Widget title;
  final Widget? subtitle;
  final Widget? secondary;
  final bool selected;
  final Function(bool?)? onChanged;

  const LocalRadioGroupItem({
    super.key,
    required this.value,
    required this.title,
    this.subtitle,
    this.secondary,
    this.selected = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      subtitle: subtitle,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (secondary != null) secondary!,
          Radio<bool>(
            value: true,
            groupValue: selected ? true : false,
            onChanged: onChanged,
          ),
        ],
      ),
      onTap: () => onChanged?.call(true),
    );
  }
}
