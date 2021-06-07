import 'package:template/views/components/interact/dialog.dart';
import 'package:template/views/components/theModal/showReportModal.dart';
import 'package:flutter/material.dart';

class FeedBackMenu extends StatelessWidget {
  const FeedBackMenu({
    Key? key,
    required this.targetType,
    required this.targetID,
  }) : super(key: key);

  final String targetType;
  final String targetID;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: PopupMenuButton(
          child: Icon(Icons.more_vert),
          onSelected: (value) {
            switch (value) {
              case 0:
                showReportModal(context, targetID, targetType);
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: 0,
                child: Text('举报'),
              ),
            ];
          }),
    );
  }
}

class ContentEditMenu extends StatelessWidget {
  const ContentEditMenu({
    Key? key,
    required this.onDelete,
  }) : super(key: key);

  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: PopupMenuButton(
          child: Icon(Icons.more_vert),
          onSelected: (value) {
            switch (value) {
              case 0:
                showTextAlert(context, "删除", "是否确认删除", onDelete);
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: 0,
                child: Text('删除'),
              ),
            ];
          }),
    );
  }
}
