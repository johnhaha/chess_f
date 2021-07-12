import 'package:template/constants/colors.dart';
import 'package:template/constants/theme.dart';
import 'package:flutter/material.dart';

showTextAlert(
    BuildContext context, String title, String content, Function onConfirm) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text(
            title,
            style: bodyText1,
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              color: Theme.of(context).backgroundColor,
              // height: 40,
              child: Text(
                content,
                style: smallBodyText,
              ),
            ),
          ),
          actions: [
            TextButton(
                style: textButtonStyle,
                onPressed: () {
                  onConfirm();
                  Navigator.pop(context);
                },
                child: Text(
                  "确认",
                  style: clickText,
                ))
          ],
        );
      });
}

showWidgetAlert(BuildContext context, String title, List<Widget> children,
    Function onConfirm,
    {double height: 300}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text(title),
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              color: Theme.of(context).backgroundColor,
              height: height,
              child: Column(
                children: children,
              ),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  onConfirm();
                },
                child: Text("确认"))
          ],
        );
      });
}
