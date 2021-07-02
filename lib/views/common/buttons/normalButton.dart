import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';
import 'package:template/constants/theme.dart';

class NormalButton extends StatefulWidget {
  const NormalButton(
      {Key? key,
      required this.title,
      required this.onPress,
      this.disabled = false,
      this.loading = false})
      : super(key: key);
  final String title;
  final void Function() onPress;
  final bool disabled;
  final bool loading;

  @override
  State<NormalButton> createState() => _NormalButtonState();
}

class _NormalButtonState extends State<NormalButton> {
  var loading = false;

  void _onPress() {
    setState(() {
      loading = true;
    });
    widget.onPress();
  }

  @override
  void initState() {
    super.initState();
    loading = widget.loading;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.disabled || loading ? () {} : _onPress,
      child: loading
          ? Container(
              width: 30,
              height: 30,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircularProgressIndicator(
                  color: TextColor,
                ),
              ))
          : Text(
              widget.title,
              style: smallBodyText,
            ),
      style: widget.disabled ? normalButtonDisableStyle : normalButtonStyle,
    );
  }
}
