import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../route/index.dart';

final _storage = GetStorage();

class Helper {
  dynamic getStorage(String name) {
    dynamic info = _storage.read(name) ?? '';
    return info != '' ? json.decode(info) : info;
  }

  dynamic writeStorage(String key, dynamic value) {
    dynamic object = value != null ? json.encode(value) : value;
    return _storage.write(key, object);
  }

  dynamic removeSpecificKeyStorage(String key) {
    _storage.remove(key);
  }

  clearStorage() {
    _storage.erase();
  }

  Future<bool> isNetworkConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity(); //Check For Wifi or Mobile data is ON/OFF
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      final result = await InternetAddress.lookup('google.com'); //Check For Internet Connection
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty)
        return true;
      else
        return false;
    }
  }

  // //#region Loading
  // void showLoading() {
  //   return loadingCtrl.showLoading();
  // }
  //
  // void hideLoading() {
  //   return loadingCtrl.hideLoading();
  // }

  snackBar(message, {context, duration}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      duration: Duration(
        milliseconds: duration == 'short' ? 1000 : (duration == 'long' ? 4000 : 2000),
      ),
    );

    ScaffoldMessenger.of(context ?? Get.context).clearSnackBars();
    ScaffoldMessenger.of(context ?? Get.context).showSnackBar(snackBar);
  }

  goToNoInternetScreen() {
    String currentRoute = Get.currentRoute;
    if (currentRoute != routeName.noInternet) {
      Get.toNamed(routeName.noInternet);
    }
  }
}
