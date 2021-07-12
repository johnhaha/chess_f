import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:template/constants/hosts.dart';
import 'package:template/constants/size.dart';
import 'package:template/extensions/screen.dart';

class ImageGallary extends StatelessWidget {
  const ImageGallary({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: images.length,
        itemBuilder: (context, index, i) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(BorderRadiusSize2),
                  child: Image.network("$imageHost/${images[index]}",
                      width: context.getSize().width - 64,
                      height: 220,
                      fit: BoxFit.cover)),
            ),
          );
        },
        options: imageGallaryOption);
  }
}

var imageGallaryOption = CarouselOptions(
    onPageChanged: (i, x) {},
    aspectRatio: 16 / 9,
    // height: (size.width) * 9 / 16,
    enableInfiniteScroll: false,
    enlargeCenterPage: false,
    viewportFraction: 0.9);
