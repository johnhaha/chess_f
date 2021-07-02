import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';

AppBar theAppBar(BuildContext context, String title, {List<Widget>? actions}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: TextColor),
    ),
    backgroundColor: Theme.of(context).backgroundColor,
    textTheme: Theme.of(context).textTheme,
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: ClickColor),
    actions: [if (actions != null) ...actions],
  );
}
