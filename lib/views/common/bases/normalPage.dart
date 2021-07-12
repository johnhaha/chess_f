import 'package:flutter/material.dart';
import 'package:template/extensions/screen.dart';

class NormalPage extends StatelessWidget {
  const NormalPage({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => context.hideKeyboard(),
      child: SafeArea(
        child: Container(
          child: child,
        ),
      ),
    );
  }
}
