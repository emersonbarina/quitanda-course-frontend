import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:quitanda/scr/components/category_tile.dart';
import 'package:quitanda/scr/components/custom_shimmer.dart';
import 'package:quitanda/scr/components/item_tile.dart';
import 'package:quitanda/scr/constants/colors.dart';
import 'package:quitanda/scr/constants/sizes.dart';
import 'package:quitanda/scr/constants/texts.dart';
import 'package:quitanda/scr/constants/app_data.dart' as app_data;

import '../../components/app_name_widget.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Frutas';

  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCardAnimation;
  var _cartQuantityItems = 0;

  void itemSelectedCartAnimations(GlobalKey gkImage) async {
    await runAddToCardAnimation(gkImage);

    setState(() {
      cartKey.currentState!.runCartAnimation((++_cartQuantityItems).toString());
    });
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return AddToCartAnimation(
      cartKey: cartKey,
      height: 30,
      width: 30,
      opacity: 0.85,
      dragAnimation: const DragToCartAnimationOptions(
        rotation: true,
      ),
      jumpAnimation: const JumpAnimationOptions(),
      createAddToCartAnimation: (runAddToCardAnimation) {
        this.runAddToCardAnimation = runAddToCardAnimation;
      },
      child: Scaffold(
        // AppBar
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const AppNameWidget(
            textSize: tFontSizeAppBar,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                right: 15,
              ),
              child: GestureDetector(
                onTap: () {},
                child: badges.Badge(
                  badgeContent: Text(
                    _cartQuantityItems.toString(),
                    style: const TextStyle(color: tColorsLight, fontSize: 12),
                  ),
                  badgeStyle: const badges.BadgeStyle(
                    shape: badges.BadgeShape.circle,
                    //badgeColor: Colors.red,
                    elevation: 0,
                  ),
                  child: AddToCartIcon(
                    key: cartKey,
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: tColorsPrimary,
                    ),
                    //  badge options of AddToCartIcon, I'm using badges.Badge
                    badgeOptions: const BadgeOptions(
                      active: false,
                      backgroundColor: Colors.red,
                      fontSize: 12,
                      foregroundColor: tColorsLight,
                      width: 15,
                      height: 15,
                    ),
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
              child: !isLoading
                  ? GridView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 9 / 11.5,
                      ),
                      itemCount: app_data.items.length,
                      itemBuilder: (_, index) {
                        return ItemTile(
                          item: app_data.items[index],
                          cartAnimationMethod: itemSelectedCartAnimations,
                        );
                      },
                    )
                  : GridView.count(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      physics: const BouncingScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 9 / 11.5,
                      children: [
                        CustomShimmer(
                          height: double.infinity,
                          width: double.infinity,
                          borderRadius: BorderRadius.circular(tBorderRadius),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
