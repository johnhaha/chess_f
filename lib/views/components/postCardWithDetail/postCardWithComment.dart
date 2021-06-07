import 'package:template/constants/colors.dart';
import 'package:template/constants/theme.dart';
import 'package:template/services/sugar/data.dart';
import 'package:template/services/sugar/post.dart';
import 'package:template/utility/time.dart';
import 'package:template/views/components/feedbackMenu.dart';
import 'package:template/views/components/spacer.dart';
import 'package:template/views/components/theComment/commentDetail/commentDetail.dart';
import 'package:template/views/components/thePicView/picView.dart';
import 'package:flutter/material.dart';
import 'package:template/extensions/navigator.dart';
import 'package:template/extensions/userInfo.dart';

class PostCardWithComment extends StatefulWidget {
  const PostCardWithComment({
    Key? key,
    required this.post,
    this.goComment = true,
    required this.onDelete,
    required this.commentCount,
    this.showCommentCount = true,
  }) : super(key: key);
  final Post post;
  final bool goComment;
  final Function(Post) onDelete;
  final int commentCount;
  final bool showCommentCount;

  @override
  _PostCardWithCommentState createState() => _PostCardWithCommentState();
}

class _PostCardWithCommentState extends State<PostCardWithComment> {
  late int commentCount;
  void _goCommentDetail(BuildContext context) {
    if (widget.goComment) {
      context.push(CommentDetail(
        targetId: widget.post.pid,
        targetType: 'post',
        target: PostCardWithComment(
          post: widget.post,
          showCommentCount: false,
          onDelete: (post) {
            widget.onDelete(post);
            Navigator.pop(context);
          },
          commentCount: commentCount,
          goComment: false,
        ),
        onCommentCountChange: onCommentCountChange,
      ));
    }
  }

  Future _deletePost() async {
    await deletePost(widget.post.pid);
    widget.onDelete(widget.post);
  }

  void onCommentCountChange(int newCount) {
    commentCount = newCount;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    commentCount = widget.commentCount;
  }

  @override
  Widget build(BuildContext context) {
    var userID = context.getUserID() ?? "";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          postContent(),
          V10(),
          Text(
            widget.post.des,
            style: bodyText1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getTimeShowFromDate(widget.post.createdAt),
                style: bodyText2,
              ),
              Row(
                children: [
                  if (widget.showCommentCount)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text("$commentCount"),
                    ),
                  GestureDetector(
                    onTap: () {
                      _goCommentDetail(context);
                    },
                    child: Icon(
                      Icons.comment,
                      color: ClickColor,
                    ),
                  ),
                  if (userID != widget.post.posterId)
                    FeedBackMenu(targetType: 'post', targetID: widget.post.pid),
                  if (userID == widget.post.posterId)
                    ContentEditMenu(
                      onDelete: _deletePost,
                    )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget postContent() {
    switch (widget.post.contentType) {
      case PostType.text:
        return Container();
      case PostType.pic:
        return PicView(picID: widget.post.contentId);
      case PostType.unknown:
        return Container();
    }
  }
}
