import 'package:flutter/material.dart';

class StaticElement extends StatelessWidget {
  const StaticElement({
    Key? key,
    required this.content,
    required this.title,
  }) : super(key: key);
  final String content;
  final String title;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Text(
          content,
          style: theme.textTheme.bodyText1,
        ),
        Text(title, style: theme.textTheme.bodyText2)
      ],
    );
  }
}
