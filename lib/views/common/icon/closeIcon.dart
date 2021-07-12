import 'package:flutter/material.dart';

class CloseIcon extends StatelessWidget {
  const CloseIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Icon(
        Icons.close,
        size: 32,
      ),
    );
  }
}
