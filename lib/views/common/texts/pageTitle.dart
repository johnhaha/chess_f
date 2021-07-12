import 'package:flutter/material.dart';
import 'package:template/constants/theme.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    Key? key,
    required this.title,
    this.trailling,
  }) : super(key: key);
  final String title;
  final Widget? trailling;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: titleText2,
          ),
          if (trailling != null) trailling!
        ],
      ),
    );
  }
}
