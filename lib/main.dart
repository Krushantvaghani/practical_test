import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:practical_test/controllers/login_controller.dart';
import 'package:practical_test/login.dart';
import 'package:practical_test/route/index.dart';
import 'package:practical_test/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  dataStorage = GetStorage();
  Get.put(LoginController());
  runApp(const MyApp());
}

GetStorage dataStorage = GetStorage();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: dataStorage.read("isLogged") == true ? HomeScreen() : LoginScreen(),
      getPages: appRoute.getPages,
    );
  }
}
