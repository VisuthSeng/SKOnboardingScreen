import 'package:example/common/route_name.dart';
import 'package:example/di/binding.dart';
import 'package:example/presentation/Home_screen.dart';
import 'package:example/presentation/Welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoute.welcome,
      home: WelcomeScreen(),
      getPages: [
        GetPage(
          name: AppRoute.welcome,
          page: () => WelcomeScreen(),
          transition: Transition.zoom,
        ),
        GetPage(
          name: AppRoute.home,
          page: () => HomeScreen(),
          transition: Transition.leftToRight,
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
