import 'package:flutter/material.dart';
import 'package:template/constants/size.dart';
import 'package:template/constants/theme.dart';

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
