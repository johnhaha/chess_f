import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';
import 'package:template/constants/theme.dart';

class TimeChip extends StatelessWidget {
  const TimeChip({
    Key? key,
    required this.hour,
    required this.selected,
    this.onSelected,
  }) : super(key: key);
  final int hour;
  final bool selected;
  final Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
        label: Text(
          "$hour:00",
          style: selected ? whiteBodyText : bodyText1,
        ),
        padding: EdgeInsets.all(8),
        showCheckmark: false,
        selected: selected,
        selectedColor: MainColor,
        backgroundColor: CardWhiteColor,
        labelPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        onSelected: onSelected);
  }
}
