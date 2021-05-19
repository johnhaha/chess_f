import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    Key? key,
    required this.textEditingController,
    required this.title,
    this.hint,
    this.keyBoard,
    this.measure,
    this.maxLine = 1,
    this.maxLength = 200,
    this.dis = "",
    this.long = true,
    this.withTitle = true,
    this.focusNode,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String title;
  final String? hint;
  final TextInputType? keyBoard;
  final String? measure;
  final int maxLine;
  final int maxLength;
  final String dis;
  final bool long;
  final bool withTitle;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: long ? 20 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (withTitle) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: theme.textTheme.headline2,
                ),
                Text(
                  dis,
                  style: theme.textTheme.bodyText2,
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
          ],
          Container(
            width: long ? size.width : size.width / 3,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      focusNode: focusNode,
                      style: TextStyle(
                          letterSpacing: 1, fontSize: 14, height: 1.3),
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
                  if (measure != null)
                    Text(
                      measure!,
                      style: Theme.of(context).textTheme.bodyText2,
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
