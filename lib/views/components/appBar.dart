import 'package:template/constants/colors.dart';
import 'package:flutter/material.dart';

AppBar theAppBar(BuildContext context, String title, {List<Widget>? actions}) {
  return AppBar(
    title: Text(title),
    backgroundColor: Theme.of(context).backgroundColor,
    textTheme: Theme.of(context).textTheme,
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: TextColor),
    actions: [if (actions != null) ...actions],
  );
}
