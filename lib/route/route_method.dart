import 'package:get/get.dart';
import 'package:practical_test/login.dart';
import 'package:practical_test/route/route_name.dart';
import 'package:practical_test/home.dart';

RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.login, page: () => LoginScreen()),
    GetPage(name: _routeName.setting, page: () => HomeScreen()),
  ];
}
