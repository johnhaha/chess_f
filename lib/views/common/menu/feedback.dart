import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';
import 'package:template/views/common/modals/showReportModal.dart';

class FeedBackMenu extends StatelessWidget {
  const FeedBackMenu({
    Key? key,
    required this.targetType,
    required this.targetID,
    this.cancelLike,
    this.notInterested,
  }) : super(key: key);

  final String targetType;
  final String targetID;
  bool get mayCancelLike => cancelLike != null;
  bool get mayNotInterested => notInterested != null;
  final Function? cancelLike;
  final Function? notInterested;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: PopupMenuButton(
          child: Icon(
            Icons.more_vert,
            color: DisColor,
          ),
          onSelected: (value) {
            switch (value) {
              case 0:
                showReportModal(context, targetID, targetType);
                break;
              case 1:
                if (notInterested != null) {
                  notInterested!();
                }
                break;
              case 2:
                if (cancelLike != null) {
                  cancelLike!();
                }
                break;
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: 0,
                child: Text(
                  '举报',
                  style: TextStyle(color: TextColor),
                ),
              ),
              if (mayNotInterested)
                const PopupMenuItem(
                  value: 1,
                  child: Text(
                    '不感兴趣',
                    style: TextStyle(color: TextColor),
                  ),
                ),
              if (mayCancelLike)
                const PopupMenuItem(
                  value: 2,
                  child: Text(
                    '取消关注',
                    style: TextStyle(color: TextColor),
                  ),
                ),
            ];
          }),
    );
  }
}
