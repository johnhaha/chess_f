import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/constants/style.dart';
import 'package:template/views/pages/tabPage/tab_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'template',
      theme: magicTheme.mainTheme,
      debugShowCheckedModeBanner: false,
      home: TabPage(),
    );
  }
}
