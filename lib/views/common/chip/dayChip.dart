import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';
import 'package:template/constants/theme.dart';

class DayChip extends StatelessWidget {
  const DayChip({
    Key? key,
    required this.text,
    required this.onSelected,
    required this.selected,
  }) : super(key: key);
  final String text;
  final Function(bool) onSelected;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
        label: Text(
          text,
          style: selected ? whiteBodyText : bodyText1,
        ),
        selected: selected,
        showCheckmark: false,
        selectedColor: MainColor,
        backgroundColor: CardWhiteColor,
        onSelected: onSelected);
  }
}
