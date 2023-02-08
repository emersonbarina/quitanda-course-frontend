import 'package:flutter/material.dart';
import 'package:quitanda/scr/components/app_name_widget.dart';
import 'package:quitanda/scr/constants/colors.dart';
import 'package:get/get.dart';
import 'package:quitanda/scr/page_route/app_pages.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), (){
      Get.offNamed(PageRoutes.signInRoute);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.purple,
              Colors.orange,
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            AppNameWidget(
              colorAppTitleColor: tColorsPrimary,
              fontWeight: FontWeight.bold,
              textSize: 50,
            ),
            SizedBox(
              height: 10,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(tColorsLight),
            ),
          ],
        ),
      ),
    );
  }
}
