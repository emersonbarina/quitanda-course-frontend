import 'package:flutter/material.dart';
import 'package:quitanda/scr/constants/colors.dart';
import 'package:quitanda/scr/constants/texts.dart';
import 'package:quitanda/scr/page_route/app_pages.dart';
import 'package:quitanda/scr/pages/auth/controller/auth_controller.dart';
import 'package:get/get.dart';

void main() {
  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: tAppName,
      theme: ThemeData(
        primarySwatch: tColorsPrimary,
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: PageRoutes.splashRoute,
      getPages: AppPages.pages,
    );
  }
}

