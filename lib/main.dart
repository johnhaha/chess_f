import 'package:template/constants/styles/theme.dart';
import 'package:template/views/pages/tabPage/tabPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bean',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: TabPage(),
    );
  }
}
