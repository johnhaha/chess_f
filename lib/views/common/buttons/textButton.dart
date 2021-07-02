import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';
import 'package:template/constants/size.dart';
import 'package:template/constants/theme.dart';

class NormalTextButton extends StatelessWidget {
  const NormalTextButton({
    Key? key,
    required this.txt,
    required this.onPress,
    this.style = TheButtonStyle.normal,
    // this.isHighlight = false,
    // this.disabled = false,
  }) : super(key: key);
  final String txt;
  final Function onPress;
  final TheButtonStyle style;
  // final bool isHighlight;
  // final bool disabled;
  // final bool isAlert;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (style != TheButtonStyle.disabled) {
          onPress();
        }
      },
      child: Text(
        txt,
        style: getNormalTextButtonStyle(style),
      ),
      style: textButtonStyle,
    );
  }
}

enum TheButtonStyle { normal, highlight, alert, disabled }

TextStyle getNormalTextButtonStyle(TheButtonStyle style) {
  switch (style) {
    case TheButtonStyle.alert:
      return TextStyle(color: AlertColor, fontSize: TitleSize2);
    case TheButtonStyle.normal:
      return bodyText1;
    case TheButtonStyle.highlight:
      return highLightText;
    case TheButtonStyle.disabled:
      return bodyText2;
  }
}
