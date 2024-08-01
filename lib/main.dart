import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_talk_clone/utils/bindings/initial_binding.dart';
import 'package:soul_talk_clone/utils/navigation/app_pages.dart';
import 'package:soul_talk_clone/utils/navigation/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      getPages: AppPages.pages,
      initialBinding: InitialBinding(),
      initialRoute: AppRoutes.splash,
    );
  }
}
