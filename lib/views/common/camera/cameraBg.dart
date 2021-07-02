import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';
import 'package:template/extensions/screen.dart';

class CameraBg extends StatelessWidget {
  const CameraBg({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CameraController controller;

  @override
  Widget build(BuildContext context) {
    var size = context.getSize();
    return Stack(
      children: [
        Container(
          height: size.height,
          child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: CameraPreview(controller)),
        ),
        Container(
          height: size.height,
          width: size.width,
          color: PageColor.withOpacity(0.6),
        ),
      ],
    );
  }
}
