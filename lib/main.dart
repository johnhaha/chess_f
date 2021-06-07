import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/constants/theme.dart';
import 'package:template/views/pages/tabPage/tabPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'template',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: TabPage(),
    );
  }
}
