import 'package:template/constants/configs.dart';
import 'package:template/constants/theme.dart';
import 'package:template/services/bean/data.dart';
import 'package:template/services/candy/comment.dart';
import 'package:template/services/candy/data.dart';
import 'package:template/utility/time.dart';
import 'package:template/views/components/feedbackMenu.dart';
import 'package:template/views/components/spacer.dart';
import 'package:template/views/components/theAvatar/roundAvatar.dart';
import 'package:template/views/components/theAvatar/theAvatar.dart';
import 'package:flutter/material.dart';
import 'package:template/extensions/userInfo.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({
    Key? key,
    required this.comment,
    required this.onDelete,
  }) : super(key: key);
  final Comment comment;
  final Function(Comment) onDelete;
  Future _deleteComment() async {
    await deleteComment(comment.cid);
    onDelete(comment);
  }

  @override
  Widget build(BuildContext context) {
    var userID = context.getUserID() ?? "";
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmallAvatarWithName(userID: SampleUserID),
              Row(
                children: [
                  Text(
                    getTimeShowFromDate(comment.createdAt),
                    style: disBodyText,
                  ),
                  if (userID != comment.authorId)
                    FeedBackMenu(
                      targetID: comment.cid,
                      targetType: 'comment',
                    ),
                  if (userID == comment.authorId)
                    ContentEditMenu(onDelete: _deleteComment)
                ],
              )
            ],
          ),
          V10(),
          Text(comment.content)
        ],
      ),
    );
  }
}

class VanillaCommentCard extends StatelessWidget {
  const VanillaCommentCard({
    Key? key,
    required this.comment,
  }) : super(key: key);

  final CommentWithUser comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoundSmallAvatarWithName(user: comment.user),
                Text(
                  getTimeShowFromDate(comment.comment.createdAt),
                )
              ],
            ),
            V10(),
            Text(comment.comment.content)
          ],
        ),
      ),
    );
  }
}
