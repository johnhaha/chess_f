import 'package:template/constants/theme.dart';
import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    Key? key,
    required this.textEditingController,
    required this.title,
    this.hint,
    this.keyBoard,
    this.maxLine = 1,
    this.maxLength = 200,
    this.dis = "",
    required this.width,
    this.focusNode,
    this.padding = 20,
    this.height = 60,
    this.tailling,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String title;
  final String? hint;
  final TextInputType? keyBoard;
  final int maxLine;
  final int maxLength;
  final String dis;
  final double width;
  final double height;
  final Widget? tailling;
  final FocusNode? focusNode;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != "") ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: titleText3,
                ),
                Text(
                  dis,
                  style: bodyText2,
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
          ],
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: TextField(
                      focusNode: focusNode,
                      style: TextStyle(
                          letterSpacing: 1, fontSize: 14, height: 1.0),
                      maxLines: maxLine,
                      maxLength: maxLength,
                      controller: textEditingController,
                      keyboardType: keyBoard,
                      onEditingComplete: () {
                        FocusScope.of(context).unfocus();
                      },
                      decoration: InputDecoration(
                          fillColor: Theme.of(context).cardColor,
                          hintText: hint,
                          border: InputBorder.none,
                          counterText: ""),
                    ),
                  ),
                  if (tailling != null) tailling!
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
