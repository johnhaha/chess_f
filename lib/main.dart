import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hey/data/user_data.dart';
import 'package:magic/components/bases/loading_page.dart';
import 'package:template/constants/app.dart';
import 'package:template/constants/style.dart';
import 'package:template/data/app_data.dart';
import 'package:template/views/pages/tabPage/tab_page.dart';
import 'package:flutter/material.dart';
import 'package:hey/extension/login.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future _tokenLogin(BuildContext context) async {
    context.read(userData).addGetAppDataFn((userID) {
      context.read(appData).getUserAppData(userID);
    });
    context.read(userData).addClearFn(() {
      context.read(appData).clearAppData();
    });
    try {
      await context.userTokenLogin(appConnection.appHost);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'template',
      theme: magicTheme.mainTheme,
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: _tokenLogin(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const TabPage();
            }
            return LoadingPage(magicTheme: magicTheme);
          }),
    );
  }
}
