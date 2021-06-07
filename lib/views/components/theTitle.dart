import 'package:template/constants/theme.dart';
import 'package:flutter/material.dart';

class OneLineTitle extends StatelessWidget {
  const OneLineTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleText3,
          ),
        ],
      ),
    );
  }
}

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
