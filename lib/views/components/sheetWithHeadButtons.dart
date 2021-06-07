import 'package:template/views/components/theButtons.dart';
import 'package:flutter/material.dart';

class SheetWithHeadButton extends StatelessWidget {
  const SheetWithHeadButton(
      {Key? key,
      required this.children,
      this.topRightButtonText = "确定",
      this.topLeftButtonText = "取消",
      required this.submit,
      this.showSubmit = true})
      : super(key: key);
  final List<Widget> children;
  final String topRightButtonText;
  final String topLeftButtonText;
  final Function submit;
  final bool showSubmit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Container(
              child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.only(top: 100, bottom: 100),
                    child: Column(
                      children: [...children],
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor.withOpacity(0.8)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            topLeftButtonText,
                            style: Theme.of(context).textTheme.button,
                          )),
                      if (showSubmit)
                        NormalButton(
                          title: topRightButtonText,
                          onPress: () {
                            submit();
                          },
                        )
                    ],
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
