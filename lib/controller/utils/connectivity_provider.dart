// import 'package:connectivity_plus/connectivity_plus.dart';

import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConnectivityProvider with ChangeNotifier {
  final Connectivity _connectivity = Connectivity();
  bool _isOnline = true;
  bool get isOnline => _isOnline;

  void startMonitoring() async {
    await initConnectivity();
    _connectivity.onConnectivityChanged.listen((result) async {
      if (result == ConnectivityResult.none) {
        _isOnline = false;
        notifyListeners();
      } else {
        // if connected check if connection work
        await _updateConnectionStatus().then((isConnected) {
          _isOnline = isConnected;
          notifyListeners();
        });
      }
    });
  }

  Future<void> initConnectivity() async {
    try {
      final ConnectivityResult connectivityResult =
          await _connectivity.checkConnectivity();
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        _isOnline = true;
        notifyListeners();
      } else {
        _isOnline = false;
        notifyListeners();
      }
    } on PlatformException catch (e) {
      print("PlatformException -> $e");
    }
  }

  // if connected but network don't work
  // call google.com if don't answer is network of
  Future<bool> _updateConnectionStatus() async {
    late bool isConnected;
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup("google.com");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      }
    } on SocketException catch (_) {
      isConnected = false;
    }

    return isConnected;
  }
}
