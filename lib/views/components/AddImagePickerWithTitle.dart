import 'package:bean_client/constants/styles/colors.dart';
import 'package:bean_client/constants/styles/size.dart';
import 'package:bean_client/views/components/spacer.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AddImagePickerWithTitle extends StatelessWidget {
  const AddImagePickerWithTitle({
    Key? key,
    required this.getImage,
    required this.image,
    this.isRound = false,
    required this.name,
  }) : super(key: key);

  final Function getImage;
  final File? image;
  final bool isRound;
  final String name;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: size.width - 40,
          child: Text(
            name,
            style: theme.textTheme.bodyText1,
          ),
        ),
        V10(),
        GestureDetector(
          onTap: () {
            getImage();
          },
          child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius:
                      BorderRadius.circular(isRound ? 60 : BorderRadiusSize1)),
              child: image == null
                  ? Icon(
                      Icons.add,
                      size: 64,
                      color: DisColor,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(
                          isRound ? 60 : BorderRadiusSize1),
                      child: Image.file(
                        image!,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    )),
        )
      ],
    );
  }
}
