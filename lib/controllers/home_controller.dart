import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../config.dart';
import '../main.dart';

class HomeController extends GetxController {
  dynamic representative = [];

  dynamic writeStorage(String key, dynamic value) {
    dynamic object = value != null ? json.encode(value) : value;
    return dataStorage.write(key, object);
  }

  dynamic getStorage(String name) {
    dynamic info = dataStorage.read(name) ?? '';
    return info != '' ? json.decode(info) : info;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    fetchData();
    super.onReady();
  }

  void fetchData() async {
    final response = await http.get(
      Uri.parse('http://134.122.109.152:8088/getRepresentativeList/C_00051'),
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      final data = jsonResponse['data'];
      var token = jsonResponse['data']['token'];
      getStorage(Session.authToken);
      representative = data;
      update();
    } else {
      print("something is wroung");
    }
  }
}
