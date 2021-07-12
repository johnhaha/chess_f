import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';

class ClickIcon extends StatelessWidget {
  const ClickIcon({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.active,
  }) : super(key: key);
  final IconData icon;
  final Function onTap;
  final bool active;

  void _onTap() {
    if (active) {
      onTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: active ? MainColor : DisColor),
        child: Icon(
          icon,
          size: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}
