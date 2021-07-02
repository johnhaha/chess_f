import 'package:geolocator/geolocator.dart';
import 'package:template/constants/colors.dart';
import 'package:template/views/common/buttons/textButton.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:template/views/common/layout/spacer.dart';

class PermissionController {
  var cameraAuth = false;
  var geoAuth = false;
  Future check() async {
    var geoPermition = await Geolocator.checkPermission();
    if (geoPermition == LocationPermission.denied ||
        geoPermition == LocationPermission.deniedForever) {
      geoAuth = false;
    } else {
      print("location auth ok");
      geoAuth = true;
    }
    var camePermition = await Permission.camera.status;
    if (camePermition.isDenied || camePermition.isPermanentlyDenied) {
    } else {
      print("camera auth ok");
      cameraAuth = true;
    }
  }

  Future checkTo(BuildContext context, Function todo) async {
    if (gotAuth()) {
      todo();
    } else {
      await request(context, todo);
    }
  }

  bool gotAuth() {
    return cameraAuth && geoAuth;
  }

  Future request(BuildContext context, Function onAuth) async {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, updateState) => Container(
              color: PageColor,
              height: 200,
              child: Column(
                children: [
                  V20(),
                  NormalTextButton(
                    txt: cameraAuth ? "已授权相机" : "授权相机",
                    onPress: () async {
                      var res = await Permission.camera.request();
                      if (res.isDenied || res.isPermanentlyDenied) {
                      } else {
                        cameraAuth = true;
                        if (gotAuth()) {
                          Navigator.pop(context);
                          onAuth();
                        }
                        updateState(() {});
                      }
                    },
                    style: cameraAuth
                        ? TheButtonStyle.disabled
                        : TheButtonStyle.highlight,
                  ),
                  V20(),
                  NormalTextButton(
                    txt: geoAuth ? "已授权位置信息" : "授权位置信息",
                    onPress: () async {
                      var res = await Geolocator.requestPermission();
                      if (res == LocationPermission.denied ||
                          res == LocationPermission.deniedForever) {
                      } else {
                        geoAuth = true;

                        if (gotAuth()) {
                          Navigator.pop(context);
                          onAuth();
                        }
                        updateState(() {});
                      }
                    },
                    style: geoAuth
                        ? TheButtonStyle.disabled
                        : TheButtonStyle.highlight,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
