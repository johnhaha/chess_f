import 'package:template/constants/colors.dart';
import 'package:template/constants/theme.dart';
import 'package:flutter/material.dart';

showTextToast(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: CardWhiteColor,
    content: Text(
      content,
      style: bodyText1,
    ),
    duration: const Duration(seconds: 1),
    action: SnackBarAction(
      textColor: MainColor,
      label: '好的',
      onPressed: ScaffoldMessenger.of(context).hideCurrentSnackBar,
    ),
  ));
}
