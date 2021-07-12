import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';
import 'package:template/constants/size.dart';
import 'package:template/extensions/screen.dart';

class ImagePickerCard extends StatelessWidget {
  const ImagePickerCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = context.getSize();
    return Container(
      width: size.width - 64,
      height: (size.width - 64) * 3 / 4,
      decoration: BoxDecoration(
          color: CardWhiteColor,
          borderRadius: BorderRadius.circular(AvatarRadius2)),
      child: Icon(
        Icons.add,
        size: 128,
        color: PageColor,
      ),
    );
  }
}
