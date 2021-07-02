import 'package:template/constants/colors.dart';
import 'package:flutter/material.dart';

showLoading(BuildContext context, {hint = ""}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
            backgroundColor: Theme.of(context).backgroundColor.withOpacity(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: CircularProgressIndicator(
                  color: MainColor,
                )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  hint,
                  style: Theme.of(context).textTheme.bodyText2,
                )
              ],
            ));
      });
}

hideLoading(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop(context);
}
