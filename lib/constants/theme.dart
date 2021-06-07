import 'package:flutter/material.dart';
import 'package:template/constants/size.dart';

import 'colors.dart';

var appTheme = ThemeData(
    brightness: Brightness.light,
    backgroundColor: PageColor,
    primaryColor: MainColor,
    errorColor: AlertColor,
    cardColor: CardWhiteColor,
    textTheme: textTheme);

var textTheme = TextTheme(
  headline1: titleText1,
  headline2: titleText2,
  headline3: titleText3,
  bodyText1: bodyText1,
  bodyText2: bodyText2,
);
var bodyText1 = TextStyle(
    fontSize: BodySize1, color: TextColor, fontWeight: FontWeight.normal);
var bodyText2 = TextStyle(
    fontSize: BodySize2, color: DisColor, fontWeight: FontWeight.normal);
var bodyText3 = TextStyle(
    fontSize: BodySize1, color: DisColor, fontWeight: FontWeight.normal);
var whiteBodyText = TextStyle(
    fontSize: BodySize1, color: CardWhiteColor, fontWeight: FontWeight.normal);
var disBodyText = TextStyle(
    fontSize: BodySize2, color: DisColor, fontWeight: FontWeight.normal);
var smallBodyText = TextStyle(
    fontSize: BodySize2, color: TextColor, fontWeight: FontWeight.normal);
var highLightText = TextStyle(
    fontSize: BodySize1, color: HighLightColor, fontWeight: FontWeight.bold);
var titleText1 = TextStyle(
    fontSize: TitleSize1, color: TextColor, fontWeight: FontWeight.normal);
var titleText2 = TextStyle(
    fontSize: TitleSize2, color: TextColor, fontWeight: FontWeight.normal);
var titleText3 = TextStyle(
    fontSize: TitleSize3, color: TextColor, fontWeight: FontWeight.normal);

var bigButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed))
          return MainColor.withOpacity(0.5);
        return MainColor; // Use the component's default.
      },
    ),
    minimumSize: MaterialStateProperty.all<Size>(Size(180, 60)),
    padding: MaterialStateProperty.all<EdgeInsets>(
        EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      // side: BorderSide(color: Colors.red),
    )),
    textStyle: MaterialStateProperty.all<TextStyle>(bodyText1));

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
      borderRadius: BorderRadius.circular(12.0),
      // side: BorderSide(color: Colors.red),
    )),
    shadowColor:
        MaterialStateProperty.all<Color>(CardWhiteColor.withOpacity(0)),
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
    textStyle: MaterialStateProperty.all<TextStyle>(smallBodyText));

//disable style
var normalButtonDisableStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed))
          return CardWhiteColor.withOpacity(1);
        return CardWhiteColor; // Use the component's default.
      },
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
      // side: BorderSide(color: Colors.red),
    )),
    textStyle: MaterialStateProperty.all<TextStyle>(smallBodyText),
    shadowColor:
        MaterialStateProperty.all<Color>(CardWhiteColor.withOpacity(0)));

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

var smallButtonStyle = ButtonStyle(
  padding: MaterialStateProperty.all<EdgeInsets>(
      EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
  minimumSize: MaterialStateProperty.all<Size>(Size(0, 0)),
  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
