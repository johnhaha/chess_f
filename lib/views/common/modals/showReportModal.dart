import 'package:template/services/fork/report.dart';
import 'package:flutter/material.dart';
import 'package:template/extensions/userInfo.dart';
import 'package:template/views/common/popups/toast.dart';

import 'modalInput.dart';

Future showReportModal(
    BuildContext context, String targetID, String targetType) async {
  var userID = context.getUserID();
  if (userID != null) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return ModalInput(
              inputTitle: '举报',
              submitTitle: '提交',
              onSubmit: (content) async {
                var res = await ReportService.addReport(
                    userID, targetID, targetType, content);
                if (res) {
                  Navigator.pop(context);
                }
              });
        });
  } else {
    showTextToast(context, "请登录后进行操作");
  }
}
