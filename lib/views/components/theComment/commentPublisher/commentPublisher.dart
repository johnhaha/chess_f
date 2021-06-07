import 'package:template/constants/colors.dart';
import 'package:template/constants/configs.dart';
import 'package:template/constants/theme.dart';
import 'package:template/services/candy/data.dart';
import 'package:template/views/components/textInput.dart';
import 'package:template/views/components/theAvatar/theAvatar.dart';
import 'package:template/views/components/theComment/commentPublisher/commentPublisherData.dart';
import 'package:flutter/material.dart';

class CommentPublisher extends StatefulWidget {
  const CommentPublisher({
    Key? key,
    required this.userID,
    required this.targetId,
    required this.targetType,
    required this.onSuccess,
  }) : super(key: key);
  final String userID;
  final String targetId;
  final String targetType;
  final Function(Comment) onSuccess;

  @override
  _CommentPublisherState createState() => _CommentPublisherState();
}

class _CommentPublisherState extends State<CommentPublisher> {
  late TextEditingController commentInput;
  late CommentPublisherData commentPublisherData;
  var inputFocus = FocusNode();
  var haveInput = false;
  void _showReply() {
    print("yesh");
    if (!haveInput && commentInput.text != "") {
      haveInput = true;
      setState(() {});
    } else if (haveInput && commentInput.text == "") {
      haveInput = false;
      setState(() {});
    }
  }

  Future _publishComment() async {
    var res = await commentPublisherData.publishComment(commentInput.text);
    if (res != null) {
      print("add ok");
      widget.onSuccess(res);
      inputFocus.unfocus();
      commentInput.text = "";
    }
  }

  @override
  void initState() {
    super.initState();
    commentInput = TextEditingController();
    commentInput.addListener(_showReply);
    commentPublisherData = CommentPublisherData(
        targetId: widget.targetId,
        targetType: widget.targetType,
        userID: widget.userID);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: PageColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          height: 72,
          width: size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SmallAvatarWithName(
                userID: SampleUserID,
                showName: false,
              ),
              CustomTextInput(
                height: 72,
                focusNode: inputFocus,
                maxLine: 3,
                textEditingController: commentInput,
                title: "",
                width: size.width - 104,
                tailling: haveInput
                    ? GestureDetector(
                        onTap: _publishComment,
                        child: Text(
                          "回复",
                          style: bodyText1,
                        ))
                    : Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
