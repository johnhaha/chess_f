import 'package:flutter/material.dart';

showTextToast(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
    duration: const Duration(seconds: 1),
    action: SnackBarAction(
      label: '好的',
      onPressed: ScaffoldMessenger.of(context).hideCurrentSnackBar,
    ),
  ));
}
