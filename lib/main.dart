import 'package:chess/views/pages/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hey/data/user_data.dart';
import 'package:hey/init.dart';
import 'package:hole/hole.dart';
import 'package:magic/components/bases/loading_page.dart';
import 'package:magic/magic.dart';
import 'package:moon/moon.dart';
import 'package:pen/init.dart';
import 'package:pump/pump.dart';
import 'package:chess/constants/app.dart';
import 'package:chess/data/app_data.dart';
import 'package:flutter/material.dart';

import 'constants/util.dart';

var topBarHeight = magicSize.x3 + magicSize.x2;

void main() {
  sharedInit(
      appName: "chess", appVersion: "1.0.0", isLocal: false, env: EnvType.pre);
  magicInit(baseSize: 12, baseColor: const Color(0xFF393939));
  heyInit(appInfo, appConnection);
  holeInit(baseUrl: 'http://asset.kuaimai.fun');
  moonInit(testHost: getCurrentHost(), onlineHost: 'red.kuaimai.fun');
  penInit(
      testHost: getCurrentHost(),
      prodHost: 'ink.kuaimai.fun',
      prodIP: "139.224.75.144");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  Future _tokenLogin(BuildContext context, WidgetRef ref) async {
    _listenToUserLoginChange(ref);
    try {
      await ref.read(userData).userTokenLogin();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp(
      title: 'chess',
      theme: magicTheme.mainTheme,
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: _tokenLogin(context, ref),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const IndexPage().systemStyle(MagicAppTheme.dark);
            }
            return const LoadingPage();
          }),
    );
  }

  Future _listenToUserLoginChange(WidgetRef ref) async {
    ref.read(userData).listenToLoginChange(onLogin: (user) async {
      await ref.read(appData).getUserAppData(user.userID);
      await ref.read(chatData).getRoomData(userID: user.userID);
      ref.read(chatData).subUserMsg(userID: user.userID);
      //start udp listen
      var inkUdpService = await penStartUdpListen(id: user.userID);
      inkUdpService.listen();
    }, onLogout: () async {
      ref.read(appData).clearAppData();
      await ref.read(chatData).unSub();
      await ref.read(chatData).clearMsg();
    });
  }
}
