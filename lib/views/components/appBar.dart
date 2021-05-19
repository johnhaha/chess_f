import 'package:bean_client/constants/styles/colors.dart';
import 'package:flutter/material.dart';

AppBar theAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(title),
    backgroundColor: Theme.of(context).backgroundColor,
    textTheme: Theme.of(context).textTheme,
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: TextColor),
  );
}
