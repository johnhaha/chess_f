import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hey/data/user_data.dart';
import 'package:hey/init.dart';
import 'package:hole/hole.dart';
import 'package:magic/components/bases/loading_page.dart';
import 'package:magic/init.dart';
import 'package:pump/pump.dart';
import 'package:template/constants/app.dart';
import 'package:template/data/app_data.dart';
import 'package:template/views/pages/tabPage/tab_page.dart';
import 'package:flutter/material.dart';

void main() {
  sharedInit(
      appName: "template",
      appVersion: "1.0.0",
      isLocal: false,
      env: EnvType.test);
  magicInit(baseSize: 12, baseColor: const Color(0xFF3165D5));
  heyInit(appInfo, appConnection);
  holeInit(baseUrl: 'http://asset.kuaimai.fun');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  Future _tokenLogin(BuildContext context, WidgetRef ref) async {
    _listenToUserLoginChange(ref);
    try {
      await ref.read(userData).userTokenLogin();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp(
      title: 'template',
      theme: magicTheme.mainTheme,
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: _tokenLogin(context, ref),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const TabPage();
            }
            return LoadingPage();
          }),
    );
  }

  Future _listenToUserLoginChange(WidgetRef ref) async {
    ref.read(userData).listenToLoginChange(onLogin: (user) {
      ref.read(appData).getUserAppData(user.userID);
    }, onLogout: () {
      ref.read(appData).clearAppData();
    });
  }
}
