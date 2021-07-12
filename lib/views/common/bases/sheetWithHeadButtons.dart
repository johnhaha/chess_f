import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';

class SheetWithHeadButton extends StatelessWidget {
  const SheetWithHeadButton({
    Key? key,
    required this.children,
    required this.submit,
    required this.back,
    this.forword,
  }) : super(key: key);
  final List<Widget> children;
  final Function? submit;
  final Widget back;
  final Widget? forword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PageColor,
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
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: back),
                      if (forword != null)
                        GestureDetector(
                            onTap: () {
                              submit!();
                            },
                            child: forword!)
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
