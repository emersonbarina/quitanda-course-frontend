import 'package:flutter/material.dart';
import 'package:quitanda/scr/constants/colors.dart';
import 'package:quitanda/scr/constants/texts.dart';
import 'package:quitanda/scr/pages/cart/cart_tab.dart';

import '../home/home_tab.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          const HomeTab(),
          CartTab(),
          Container(color: Colors.blue,),
          Container(color: Colors.green,),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageController.jumpToPage(index);
          });
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
    );
  }
}
