import 'dart:io';

import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';
import 'package:template/constants/size.dart';
import 'package:template/constants/theme.dart';
import 'package:template/views/common/layout/spacer.dart';

class AddImagePickerWithTitle extends StatelessWidget {
  const AddImagePickerWithTitle({
    Key? key,
    required this.getImage,
    required this.image,
    this.isRound = false,
    required this.name,
    required this.imageUrl,
    this.width = 120,
    this.radius = BorderRadiusSize1,
  }) : super(key: key);

  final Function getImage;
  final File? image;
  final bool isRound;
  final String name;
  final String imageUrl;
  final double width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (name != "") ...[
          Container(
            width: size.width - 40,
            child: Text(
              name,
              style: bodyText1,
            ),
          ),
          V10(),
        ],
        GestureDetector(
          onTap: () {
            print("getting image now");
            getImage();
          },
          child: Container(
              width: width,
              height: width,
              decoration: BoxDecoration(
                  color: CardWhiteColor,
                  borderRadius:
                      BorderRadius.circular(isRound ? width / 2 : radius)),
              child: image == null
                  ? imageUrl == ""
                      ? Icon(
                          Icons.add,
                          size: 64,
                          color: PageColor,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(
                              isRound ? width / 2 : radius),
                          child: Image.network(
                            imageUrl,
                            width: width,
                            height: width,
                            fit: BoxFit.cover,
                          ))
                  : ClipRRect(
                      borderRadius:
                          BorderRadius.circular(isRound ? width / 2 : radius),
                      child: Image.file(
                        image!,
                        width: width,
                        height: width,
                        fit: BoxFit.cover,
                      ),
                    )),
        )
      ],
    );
  }
}
