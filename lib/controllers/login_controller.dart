import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:practical_test/config.dart';
import 'package:practical_test/route/index.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class LoginController extends GetxController {
  TextEditingController userName = TextEditingController();
  TextEditingController pass = TextEditingController();

  dynamic writeStorage(String key, dynamic value) {
    dynamic object = value != null ? json.encode(value) : value;
    return dataStorage.write(key, object);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    login();
    super.onInit();
  }

  void login() async {
    final response = await http.post(
      Uri.parse('http://134.122.109.152:8088/login'),
      encoding: Encoding.getByName('utf-8'),
      body: {
        "userName": userName.text,
        "password": pass.text,
      },
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var token = jsonResponse['data']['token'];
      // dataStorage.write("token", token);
      writeStorage(Session.authToken, token);
      print("Token stored: $token");
      Get.toNamed(routeName.setting);
    } else {
      print("Please check user name and password");
    }
  }
}
