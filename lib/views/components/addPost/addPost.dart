import 'dart:io';

import 'package:template/services/sugar/data.dart';
import 'package:template/utility/image.dart';
import 'package:template/views/components/addPost/addPostData.dart';
import 'package:template/views/components/choosenImage/choosenImage.dart';
import 'package:template/views/components/interact/showLoading.dart';
import 'package:template/views/components/interact/toast.dart';
import 'package:template/views/components/sheetWithHeadButtons.dart';
import 'package:template/views/components/textInput.dart';
import 'package:template/views/components/theButtons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage(
      {Key? key,
      required this.posterID,
      required this.posterType,
      required this.targetID,
      required this.targetType,
      required this.onSuccess})
      : super(key: key);
  final String posterID;
  final String posterType;
  final String targetID;
  final String targetType;
  final Function(Post) onSuccess;

  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  final picker = ImagePicker();
  List<File> images = [];
  late TextEditingController postInput;
  late AddPostPageData addPostPageData;
  var postType = PostType.text;
  Future _addPost() async {
    showLoading(context);
    Post? _post;
    if (postInput.text != "" && images.length == 0) {
      _post = await addPostPageData.addPagePost(postInput.text, postType, "");
    } else if (images.length > 0) {
      _post = await addPostPageData.addCampusPicPost(images, postInput.text);
    }
    if (_post != null) {
      Navigator.pop(context);
      widget.onSuccess(_post);
    }
    hideLoading(context);
  }

  Future _addImage() async {
    if (images.length >= 8) {
      showTextToast(context, "最多支持8张图片");
      return;
    }
    showLoading(context);
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      var _image = await uiCropImage(File(pickedFile.path), 0.75);
      images.add(_image);
      setState(() {});
    }
    hideLoading(context);
  }

  void _onDeleteImage(int index) {
    images.removeAt(index);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    postInput = TextEditingController();
    addPostPageData = AddPostPageData(
        posterID: widget.posterID,
        posterType: widget.posterType,
        targetID: widget.targetID,
        targetType: widget.targetType);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SheetWithHeadButton(children: [
      CustomTextInput(
        textEditingController: postInput,
        title: "",
        width: size.width,
        maxLine: 10,
        height: 200,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            NormalTextButton(
              onPress: _addImage,
              txt: '添加图片',
            )
          ],
        ),
      ),
      Container(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.count(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 4,
            childAspectRatio: 1,
            children: List.generate(
                images.length,
                (index) => ChoosenImage(
                      key: UniqueKey(),
                      image: images[index],
                      index: index,
                      onDelete: _onDeleteImage,
                    )),
          ),
        ),
      )
    ], submit: _addPost);
  }
}
