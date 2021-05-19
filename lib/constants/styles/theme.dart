import 'package:bean_client/constants/styles/size.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

var appTheme = ThemeData(
    brightness: Brightness.light,
    backgroundColor: PageColor,
    primaryColor: MainColor,
    errorColor: AlertColor,
    cardColor: CardWhiteColor,
    textTheme: textTheme);

var textTheme = TextTheme(
  headline1: TextStyle(
      fontSize: TitleSize1, color: TextColor, fontWeight: FontWeight.normal),
  headline2: TextStyle(
      fontSize: TitleSize2, color: TextColor, fontWeight: FontWeight.normal),
  headline3: TextStyle(
      fontSize: BodySize1, color: CardWhiteColor, fontWeight: FontWeight.bold),
  bodyText1: TextStyle(
      fontSize: BodySize1, color: TextColor, fontWeight: FontWeight.normal),
  bodyText2: TextStyle(
      fontSize: BodySize2, color: DisColor, fontWeight: FontWeight.normal),
);

var whiteBodyText = TextStyle(
    fontSize: BodySize1, color: CardWhiteColor, fontWeight: FontWeight.normal);

var disBodyText = TextStyle(
    fontSize: BodySize1, color: DisColor, fontWeight: FontWeight.normal);
var highLightText = TextStyle(
    fontSize: BodySize1, color: HighLightColor, fontWeight: FontWeight.bold);

var bigButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed))
          return MainColor.withOpacity(0.5);
        return MainColor; // Use the component's default.
      },
    ),
    minimumSize: MaterialStateProperty.all<Size>(Size(180, 40)),
    padding: MaterialStateProperty.all<EdgeInsets>(
        EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.0),
      // side: BorderSide(color: Colors.red),
    )),
    textStyle: MaterialStateProperty.all<TextStyle>(whiteBodyText));

var bigGreyButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed))
          return CardWhiteColor.withOpacity(0.5);
        return CardWhiteColor; // Use the component's default.
      },
    ),
    minimumSize: MaterialStateProperty.all<Size>(Size(180, 40)),
    padding: MaterialStateProperty.all<EdgeInsets>(
        EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.0),
      // side: BorderSide(color: Colors.red),
    )),
    textStyle: MaterialStateProperty.all<TextStyle>(disBodyText));

var normalButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed))
          return MainColor.withOpacity(0.5);
        return MainColor; // Use the component's default.
      },
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
      // side: BorderSide(color: Colors.red),
    )),
    textStyle: MaterialStateProperty.all<TextStyle>(whiteBodyText));

var textButtonStyle = ButtonStyle(
  textStyle: MaterialStateProperty.resolveWith<TextStyle>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed))
        return TextStyle(color: TextColor.withOpacity(0.5));
      return TextStyle(
          color: TextColor.withOpacity(0.5)); // Use the component's default.
    },
  ),
);

var bigTitle =
    TextStyle(fontSize: 32, color: TextColor, fontWeight: FontWeight.bold);
