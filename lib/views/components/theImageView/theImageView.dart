import 'package:template/services/sugar/api.dart';
import 'package:template/views/components/theImageView/theImageViewData.dart';
import 'package:flutter/material.dart';

class TheImageView extends StatefulWidget {
  const TheImageView({Key? key, required this.imageID, this.radius = 0})
      : super(key: key);
  final String imageID;
  final double radius;

  @override
  _TheImageViewState createState() => _TheImageViewState();
}

class _TheImageViewState extends State<TheImageView> {
  late TheImageViewData theImageViewData;
  Future _getImageInfo() async {
    await theImageViewData.getImageInfo();
    if (theImageViewData.getImageInfoOK) {
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    super.initState();
    theImageViewData = TheImageViewData(imageID: widget.imageID);
    _getImageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: theImageViewData.getImageInfoOK
            ? ClipRRect(
                borderRadius: BorderRadius.circular(widget.radius),
                child: Image.network(
                  "$sugarHost/${theImageViewData.imageInfo!.url}",
                  fit: BoxFit.cover,
                ),
              )
            : Container());
  }
}
