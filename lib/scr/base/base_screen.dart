import 'package:flutter/material.dart';
import 'package:quitanda/scr/constants/colors.dart';
import 'package:quitanda/scr/constants/texts.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: tColorsPrimaryBackGround,
      ),
      bottomNavigationBar: BottomNavigationBar(
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
