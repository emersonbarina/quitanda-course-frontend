import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:quitanda/scr/constants/colors.dart';
import 'package:quitanda/scr/constants/sizes.dart';
import 'package:quitanda/scr/constants/texts.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text.rich(
          TextSpan(
            style: TextStyle(
              fontSize: tFontSizeAppBar,
            ),
            children: [
              TextSpan(
                  text: tAppTitle1, style: TextStyle(color: tColorsPrimary)),
              TextSpan(text: tAppTitle2, style: TextStyle(color: tColorsDark)),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 15,
            ),
            child: GestureDetector(
              onTap: () {},
              child: const badges.Badge(
                badgeContent: Text(
                  '2',
                  style: TextStyle(color: tColorsLight, fontSize: 12),
                ),
                badgeStyle: badges.BadgeStyle(
                  shape: badges.BadgeShape.circle,
                  //badgeColor: Colors.red,
                  elevation: 0,
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: tColorsPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                isDense: true,
                hintText: tSearchHint,
                hintStyle: const TextStyle(
                  color: tColorsDark,
                  fontSize: tFontSizeButton,
                ),
                prefixIcon: const Icon(
                  Icons.search_outlined,
                  color: tColorsDark,
                  size: 21,
                ),
                fillColor: tColorsLight,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
          ),

          // Categories

          // Grid
        ],
      ),
    );
  }
}
