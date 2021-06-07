import 'package:template/constants/size.dart';
import 'package:template/constants/theme.dart';
import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  const NormalButton({
    Key? key,
    required this.title,
    required this.onPress,
    this.disabled = false,
  }) : super(key: key);
  final String title;
  final void Function() onPress;
  final bool disabled;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled ? () {} : onPress,
      child: Text(
        title,
        style: smallBodyText,
      ),
      style: disabled ? normalButtonDisableStyle : normalButtonStyle,
    );
  }
}

class NormalTextButton extends StatelessWidget {
  const NormalTextButton({
    Key? key,
    required this.txt,
    required this.onPress,
    this.isHighlight = false,
  }) : super(key: key);
  final String txt;
  final Function onPress;
  final bool isHighlight;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPress();
      },
      child: Text(
        txt,
        style: isHighlight ? highLightText : bodyText1,
      ),
      style: textButtonStyle,
    );
  }
}

class SmallTextButton extends StatelessWidget {
  const SmallTextButton({
    Key? key,
    required this.txt,
    required this.onPress,
    this.isHighlight = false,
  }) : super(key: key);
  final String txt;
  final Function onPress;
  final bool isHighlight;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPress();
      },
      child: Text(
        txt,
        style: bodyText2,
      ),
      style: textButtonStyle,
    );
  }
}

class BigButton extends StatelessWidget {
  const BigButton({
    Key? key,
    required this.txt,
    required this.onPress,
    this.disabled = false,
  }) : super(key: key);
  final String txt;
  final Function onPress;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ButtonHeight1,
      width: ButtonWidth1,
      child: ElevatedButton(
        onPressed: () {
          if (!disabled) {
            onPress();
          }
        },
        child: Text(
          txt,
          style: disabled ? bodyText3 : bodyText1,
        ),
        style: disabled ? bigGreyButtonStyle : bigButtonStyle,
      ),
    );
  }
}
