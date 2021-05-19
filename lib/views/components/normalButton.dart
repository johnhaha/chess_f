import 'package:bean_client/constants/styles/theme.dart';
import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  const NormalButton({
    Key? key,
    required this.buttonText,
    required this.onTap,
    this.isDark = false,
  }) : super(key: key);
  final String buttonText;
  final Function onTap;
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: normalButtonStyle,
      child: Text(buttonText),
    );
  }
}
