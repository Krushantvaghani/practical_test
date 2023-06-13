import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../config.dart';
import '../main.dart';

class HomeController extends GetxController {
  dynamic representativeList = [];

  dynamic writeStorage(String key, dynamic value) {
    dynamic object = value != null ? json.encode(value) : value;
    return dataStorage.write(key, object);
  }

  dynamic getStorage(String name) {
    dynamic info = dataStorage.read(name) ?? '';
    return info != '' ? json.decode(info) : info;
  }

  var isCheckedList = <bool>[].obs;

  void toggleChecked(int index) {
    isCheckedList[index] = !isCheckedList[index];
  }

  @override
  void onReady() {
    // TODO: implement onReady
    fetchData();
    super.onReady();
  }

  void fetchData() async {
    final authToken = getStorage(Session.authToken);

    final response = await http.get(
      Uri.parse('http://134.122.109.152:8088/getRepresentativeList/C_00051'),
      headers: {
        'Authorization': 'Bearer $authToken', // Pass the token in the Authorization header
      },
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      final data = jsonResponse['data'];
      // var token = jsonResponse['data']['token'];
      getStorage(Session.authToken);
      representativeList = data;
      print("Representation data please check it, $representativeList");
      update();
    } else {
      print("something is wroung");
    }
  }
}
