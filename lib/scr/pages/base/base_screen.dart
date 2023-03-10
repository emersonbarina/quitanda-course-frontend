import 'package:flutter/material.dart';
import 'package:quitanda/scr/constants/colors.dart';
import 'package:quitanda/scr/constants/texts.dart';
import 'package:quitanda/scr/pages/base/controller/navigation_controller.dart';
import 'package:quitanda/scr/pages/cart/view/cart_tab.dart';
import 'package:quitanda/scr/pages/orders/orders_tab.dart';
import 'package:quitanda/scr/pages/profile/profile_tab.dart';

import '../home/view/home_tab.dart';
import 'package:get/get.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final navigationController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: navigationController.pageController,
        children: const [
          HomeTab(),
          CartTab(),
          OrdersTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: navigationController.currentIndex,
          onTap: (index) {
            navigationController.navigationPageView(index);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: tColorsPrimary,
          selectedItemColor: tColorsLight,
          unselectedItemColor: tColorsLightUnselected,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: tNavHome,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_checkout_outlined),
              label: tNavCart,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_outlined),
              label: tNavOrder,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: tNavProfile,
            ),
          ],
        ),
      ),
    );
  }
}
