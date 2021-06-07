import 'package:template/constants/colors.dart';
import 'package:template/constants/size.dart';
import 'package:template/views/components/spacer.dart';
import 'package:template/views/components/theImageView/theImageView.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AddImagePickerWithTitle extends StatelessWidget {
  const AddImagePickerWithTitle({
    Key? key,
    required this.getImage,
    required this.image,
    this.isRound = false,
    required this.name,
    required this.imageID,
  }) : super(key: key);

  final Function getImage;
  final File? image;
  final bool isRound;
  final String name;
  final String imageID;

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
            print("getting image now");
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
                  ? imageID == ""
                      ? Icon(
                          Icons.add,
                          size: 64,
                          color: DisColor,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(
                              isRound ? 60 : BorderRadiusSize1),
                          child: TheImageView(imageID: imageID))
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
