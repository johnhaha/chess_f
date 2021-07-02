import 'dart:io';
import 'package:template/constants/colors.dart';
import 'package:image/image.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path/path.dart' as p;

enum ImageSize { Small, Normal, Big, Mini }

class ImageFrame {
  ImageFrame({required this.width, required this.height});
  int width;
  int height;
}

Image resizeImage(File image, ImageSize imageSize) {
  print(image.path);
  var ext = p.extension(image.path);
  print(ext);
  var maxWidth = 480;
  if (imageSize == ImageSize.Big) {
    maxWidth = 720;
  } else if (imageSize == ImageSize.Small) {
    maxWidth = 360;
  } else if (imageSize == ImageSize.Mini) {
    maxWidth = 280;
  }
  var imageDataRaw = decodeImage(image.readAsBytesSync())!;
  var imageData = imageDataRaw;
  if (imageDataRaw.width >= maxWidth || imageDataRaw.height >= maxWidth) {
    if (imageDataRaw.width > imageDataRaw.height) {
      imageData = copyResize(imageData, width: maxWidth);
    } else {
      imageData = copyResize(imageData, height: maxWidth);
    }
  }
  return imageData;
}

ImageFrame getFileImageRatio(File theImage) {
  var image = decodeImage(theImage.readAsBytesSync())!;
  var imageWidth = image.width;
  var imageHeight = image.height;
  // var ratio = imageWidth/imageHeight;
  return ImageFrame(width: imageWidth, height: imageHeight);
}

List<int> getJpgData(Image image, {quality = 70}) {
  var imageData = encodeJpg(image, quality: quality);
  return imageData;
}

Future<File> uiCropImage(File image, double minRatio) async {
  var _imageFrame = getFileImageRatio(image);
  if (_imageFrame.width / _imageFrame.height >= minRatio) {
    return image;
  }
  var croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: "裁剪",
          toolbarColor: PageColor,
          toolbarWidgetColor: TextColor,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false,
          hideBottomControls: true),
      iosUiSettings: IOSUiSettings(
          title: "裁剪",
          minimumAspectRatio: minRatio,
          rectX: 0,
          rectY: 200,
          rotateButtonsHidden: true,
          doneButtonTitle: '完成',
          cancelButtonTitle: '取消'
          // rectWidth: _imageFrame.width.toDouble(),
          // rectHeight: _imageFrame.height.toDouble() / minRatio,
          ));
  return croppedFile ?? image;
}
