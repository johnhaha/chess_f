import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';
import 'package:template/views/common/buttons/textButton.dart';
import 'package:template/views/common/layout/spacer.dart';

Future showDeleteModal(BuildContext context, Function onDelete) async {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: PageColor,
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                NormalTextButton(
                  txt: "删除",
                  onPress: onDelete,
                  style: TheButtonStyle.alert,
                ),
                V10(),
                NormalTextButton(
                    txt: "取消", onPress: () => Navigator.pop(context))
              ],
            ),
          ),
        );
      });
}
