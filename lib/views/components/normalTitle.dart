import 'package:flutter/material.dart';

class NormalTitle extends StatelessWidget {
  const NormalTitle({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: theme.textTheme.headline1,
      ),
    );
  }
}
