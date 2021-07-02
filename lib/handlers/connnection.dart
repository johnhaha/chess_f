import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/data/appData.dart';

class ConnectionHandler {
  ConnectivityResult connection = ConnectivityResult.none;
  StreamSubscription<ConnectivityResult>? subscription;

  Future<bool> checkConnection() async {
    final Connectivity _connectivity = Connectivity();
    try {
      connection = await _connectivity.checkConnectivity();
      print(connection);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future listenToConnectionChange(
      {required BuildContext context,
      required Function onConnected,
      required Function onLost}) async {
    await checkConnection();
    context.read(appData).updateConnection(connection);
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      print(result);
      context.read(appData).updateConnection(result);
      // Got a new connectivity status!
      if (result == ConnectivityResult.none && connection != result) {
        onLost();
        print("no connection");
      } else if (result != ConnectivityResult.none &&
          connection == ConnectivityResult.none) {
        onConnected();
      }
      connection = result;
    });
  }

  cancelSubscription() {
    if (subscription != null) {
      subscription!.cancel();
    }
  }
}
