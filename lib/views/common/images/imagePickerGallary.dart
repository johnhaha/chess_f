import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:template/constants/size.dart';
import 'package:template/extensions/screen.dart';
import 'package:template/views/common/modals/deleteModel.dart';

import 'imageGallary.dart';

class ImagePickerGallary extends StatelessWidget {
  const ImagePickerGallary({
    Key? key,
    required List<PickedFile>? imageFileList,
    required this.onDelete,
  })  : _imageFileList = imageFileList,
        super(key: key);

  final List<PickedFile>? _imageFileList;
  final Function(int) onDelete;

  @override
  Widget build(BuildContext context) {
    var size = context.getSize();
    return CarouselSlider.builder(
        itemCount: _imageFileList!.length,
        itemBuilder: (context, index, i) {
          return GestureDetector(
            onTap: () {
              showDeleteModal(context, () {
                onDelete(index);
                Navigator.pop(context);
              });
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(AvatarRadius2),
                child: Image.file(
                  File(_imageFileList![index].path),
                  width: size.width - 64,
                  fit: BoxFit.cover,
                )),
          );
        },
        options: imageGallaryOption);
  }
}
