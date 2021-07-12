import 'package:flutter/material.dart';
import 'package:template/views/common/icon/clickIcon.dart';
import 'package:template/views/common/inputs/textInput.dart';
import 'package:template/extensions/screen.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
    required this.searchInput,
    required this.focusNode,
    required this.isInputing,
    required this.clear,
  }) : super(key: key);

  final TextEditingController searchInput;
  final FocusNode focusNode;
  final bool isInputing;
  final Function clear;

  @override
  Widget build(BuildContext context) {
    return CustomTextInput(
      focusNode: focusNode,
      hint: "搜索...",
      textEditingController: searchInput,
      title: "",
      width: context.getSize().width,
      tailling: ClickIcon(
        icon: isInputing ? Icons.close : Icons.search,
        onTap: isInputing ? clear : () {},
        active: true,
      ),
    );
  }
}
