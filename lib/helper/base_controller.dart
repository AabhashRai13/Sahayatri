import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

enum AppState{
  BUSY,
  IDLE,
  ERROR
}

mixin BaseController on ChangeNotifier {
  AppState _appState = AppState.IDLE;

  StreamSubscription<ConnectivityResult> subscription;

  bool _isConnected = false;

  bool _disposed = false;
  bool get disposed =>_disposed;

  bool get busy => _appState == AppState.BUSY;

  bool get isConnected => _isConnected;

  bool get hasError => _appState == AppState.ERROR;
  String _errorMsg;

  String get errorMessage => _errorMsg;

  void setBusy(bool value) {
    _appState = value ? AppState.BUSY : AppState.IDLE;
    notify();
  }

  notify(){
    if (!_disposed) {
      notifyListeners();
    }
  }


  void setError(String errorMsg) {
    _errorMsg = errorMsg;
    _appState = AppState.ERROR;
    if (!_disposed) {
      notifyListeners();
    }
  }

  Future<bool> isInternetConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  Future addConnectivityListener({Function onConnected}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    _isConnected = connectivityResult != ConnectivityResult.none;
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {

      if (!_isConnected && result != ConnectivityResult.none) {
        _isConnected = result != ConnectivityResult.none;
        onConnected(onChangeStatus:result);
      }
    });
    return true;
  }

  @override
  void dispose() {
    _disposed = true;
    if (subscription != null) {
      subscription.cancel();
    }
    super.dispose();
  }
}
