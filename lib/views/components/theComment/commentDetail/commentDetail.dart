import 'package:template/constants/colors.dart';
import 'package:template/constants/configs.dart';
import 'package:template/services/candy/data.dart';
import 'package:template/views/components/appBar.dart';
import 'package:template/views/components/spacer.dart';
import 'package:template/views/components/theComment/commentPublisher/commentPublisher.dart';
import 'package:template/views/components/theComment/theComment.dart';
import 'package:template/views/components/theTitle.dart';
import 'package:flutter/material.dart';
import 'package:template/extensions/keyboard.dart';

import 'commentDetailData.dart';

class CommentDetail extends StatefulWidget {
  const CommentDetail(
      {Key? key,
      required this.targetId,
      required this.targetType,
      this.target,
      required this.onCommentCountChange})
      : super(key: key);
  final String targetId;
  final String targetType;
  final Widget? target;
  final Function(int) onCommentCountChange;

  @override
  _CommentDetailState createState() => _CommentDetailState();
}

class _CommentDetailState extends State<CommentDetail> {
  late CommentDetailData commentDetailData;

  Future _getDetailData() async {
    var res = await commentDetailData.getComments();
    if (res) {
      setState(() {});
    }
  }

  void _onAddComment(Comment comment) {
    commentDetailData.comments.insert(0, comment);
    widget.onCommentCountChange(commentDetailData.comments.length);
    setState(() {});
  }

  void _onDeleteComment(Comment comment) {
    commentDetailData.comments
        .removeWhere((element) => element.cid == comment.cid);
    widget.onCommentCountChange(commentDetailData.comments.length);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    commentDetailData = CommentDetailData(
        targetId: widget.targetId, targetType: widget.targetType);
    _getDetailData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: theAppBar(context, "回复详情"),
      backgroundColor: PageColor,
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => context.hideKeyboard(),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomScrollView(
                slivers: [
                  if (widget.target != null)
                    SliverToBoxAdapter(child: widget.target),
                  SliverToBoxAdapter(
                    child: OneLineTitle(
                      title: '回复 ${commentDetailData.comments.length}',
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                    return CommentCard(
                      comment: commentDetailData.comments[index],
                      onDelete: _onDeleteComment,
                    );
                  }, childCount: commentDetailData.comments.length)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: V60(),
                    ),
                  )
                ],
              ),
              CommentPublisher(
                userID: SampleUserID,
                targetId: widget.targetId,
                targetType: widget.targetType,
                onSuccess: _onAddComment,
              )
            ],
          ),
        ),
      ),
    );
  }
}
