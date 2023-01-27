import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:quitanda/scr/components/category_tile.dart';
import 'package:quitanda/scr/components/item_tile.dart';
import 'package:quitanda/scr/constants/colors.dart';
import 'package:quitanda/scr/constants/sizes.dart';
import 'package:quitanda/scr/constants/texts.dart';
import 'package:quitanda/scr/constants/app_data.dart' as app_data;

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Frutas';

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
          Container(
            padding: const EdgeInsets.only(left: 25),
            height: tHeightSizeBox,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return CategoryTile(
                  onPressed: () {
                    setState(() {
                      selectedCategory = app_data.categories[index];
                    });
                  },
                  category: app_data.categories[index],
                  isSelected: app_data.categories[index] == selectedCategory,
                );
              },
              separatorBuilder: (_, index) => const SizedBox(width: 10),
              itemCount: app_data.categories.length,
            ),
          ),

          // Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:  2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 9 / 11.5,
              ),
              itemCount: app_data.items.length,
              itemBuilder: (_, index) {
                return ItemTile(
                  item: app_data.items[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
