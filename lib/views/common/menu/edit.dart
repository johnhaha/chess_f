import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';
import 'package:template/views/common/popups/dialog.dart';
import 'package:template/extensions/navigator.dart';

class ContentEditMenu extends StatelessWidget {
  const ContentEditMenu({
    Key? key,
    required this.onDelete,
    this.editPage,
    this.deleteText = '删除',
    this.deleteDes = '是否确认删除',
  }) : super(key: key);

  final Function onDelete;
  final Widget? editPage;
  final String deleteText;
  final String deleteDes;

  bool get showEdit => editPage != null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: PopupMenuButton(
          color: CardWhiteColor,
          child: Icon(
            Icons.more_vert,
            color: ClickColor,
          ),
          onSelected: (value) {
            switch (value) {
              case 0:
                showTextAlert(context, deleteText, deleteDes, onDelete);
                break;
              case 1:
                context.popUp(editPage!);
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              if (showEdit)
                const PopupMenuItem(
                  value: 1,
                  child: Text(
                    '编辑',
                    style: TextStyle(color: TextColor),
                  ),
                ),
              PopupMenuItem(
                value: 0,
                child: Text(
                  deleteText,
                  style: TextStyle(color: AlertColor),
                ),
              ),
            ];
          }),
    );
  }
}
