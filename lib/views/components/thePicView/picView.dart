import 'package:template/constants/colors.dart';
import 'package:template/views/components/theImageView/theImageView.dart';
import 'package:template/views/components/thePicView/picViewData.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PicView extends StatefulWidget {
  const PicView({Key? key, required this.picID}) : super(key: key);
  final String picID;

  @override
  _PicViewState createState() => _PicViewState();
}

class _PicViewState extends State<PicView> {
  late PicViewData picViewData;
  var currentImageIndex = 0;
  void _changeImage(int index) {
    currentImageIndex = index;
    setState(() {});
  }

  Future _getPicData() async {
    var res = await picViewData.getPicViewInfo();
    if (res && mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    picViewData = PicViewData(picID: widget.picID);
    _getPicData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      // color: HighLightColor,
      child: (picViewData.pic != null && picViewData.pic!.imageNum > 0)
          ? Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CarouselSlider.builder(
                    itemCount: picViewData.pic!.images.length,
                    itemBuilder: (context, index, i) {
                      return Container(
                        width: size.width,
                        child: TheImageView(
                          imageID: picViewData.pic!.images[index],
                          radius: 12,
                        ),
                      );
                    },
                    options: CarouselOptions(
                        onPageChanged: (i, x) {
                          _changeImage(i);
                        },
                        height: (size.width) * 9 / 16,
                        enableInfiniteScroll: false,
                        enlargeCenterPage: true,
                        viewportFraction: 1.0)),
                if (picViewData.pic!.images.length > 1)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        picViewData.pic!.images.length,
                        (index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 4),
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                    color: currentImageIndex == index
                                        ? HighLightColor
                                        : CardWhiteColor,
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                            )),
                  )
              ],
            )
          // Padding(
          //     padding: const EdgeInsets.symmetric(vertical: 10),
          //     child: TheImageView(
          //       imageID: picViewData.pic!.images[0],
          //       radius: 12,
          //     ),
          //   )
          : null,
    );
  }
}
