import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/scr/components/custom_shimmer.dart';
import 'package:quitanda/scr/pages/home/controller/home_controller.dart';
import 'package:quitanda/scr/pages/home/view/components/item_tile.dart';
import 'package:quitanda/scr/constants/colors.dart';
import 'package:quitanda/scr/constants/sizes.dart';
import 'package:quitanda/scr/constants/texts.dart';

import '../../../components/app_name_widget.dart';
import '../../base/controller/navigation_controller.dart';
import '../../cart/controller/cart_controller.dart';
import 'components/category_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();

  final searchController = TextEditingController();

  late Function(GlobalKey) runAddToCardAnimation;

//  var _cartQuantityItems = 0;

  void itemSelectedCartAnimations(GlobalKey gkImage) async {
    await runAddToCardAnimation(gkImage);

//    setState(() {
//      cartKey.currentState!.runCartAnimation((++_cartQuantityItems).toString());
//    });
  }

  final navigationController = Get.find<NavigationController>();

  //final controller = Get.find<CartController>();

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
              child: GetBuilder<CartController>(
                builder: (controller) {
                  return GestureDetector(
                    onTap: () {
                      navigationController.navigationPageView(NavigationTabs.cart);
                    },
                    child: badges.Badge(
                      badgeContent: Text(
                        controller.getCartTotalItems().toString(),
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
                  );
                }
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            // Search
            GetBuilder<HomeController>(
              builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: TextFormField(
                    controller: searchController,
                    onChanged: (value) {
                      controller.searchTitle.value = value;
                    },
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
                      suffixIcon: controller.searchTitle.value.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                searchController.clear();
                                controller.searchTitle.value = '';
                                FocusScope.of(context).unfocus();
                              },
                              icon: const Icon(
                                Icons.close,
                                color: tColorsPrimary,
                                size: 21,
                              ))
                          : null,
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
                );
              },
            ),

            // Categories
            GetBuilder<HomeController>(
              builder: (controller) {
                return Container(
                  padding: const EdgeInsets.only(left: 25),
                  height: tHeightSizeBox,
                  child: !controller.isCategoryLoading
                      ? ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return CategoryTile(
                              onPressed: () {
                                controller.selectCategory(
                                    controller.allCategories[index]);
                              },
                              category: controller.allCategories[index].title,
                              isSelected: controller.allCategories[index] ==
                                  controller.currentCategory,
                            );
                          },
                          separatorBuilder: (_, index) =>
                              const SizedBox(width: 10),
                          itemCount: controller.allCategories.length,
                        )
                      : ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            6,
                            (index) => Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(right: 12),
                              child: CustomShimmer(
                                height: 20,
                                width: 80,
                                borderRadius: BorderRadius.circular(
                                    tBorderRadiusCategory),
                              ),
                            ),
                          ),
                        ),
                );
              },
            ),

            // Grid
            GetBuilder<HomeController>(
              builder: (controller) {
                return Expanded(
                  child: !controller.isProductLoading
                      ? Visibility(
                          visible: (controller.currentCategory?.items ?? [])
                              .isNotEmpty,
                          replacement: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.search_off,
                                size: 40,
                                color: tColorsLight,
                              ),
                              Text(tNotItems),
                            ],
                          ),
                          child: GridView.builder(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 9 / 11.5,
                            ),
                            itemCount: controller.allProducts.length,
                            itemBuilder: (_, index) {
                              // last items of allProducts
                              if (((index + 1) ==
                                      controller.allProducts.length) &&
                                  !controller.isLastPage) {
                                controller.loadMoreProducts();
                              }

                              return ItemTile(
                                item: controller.allProducts[index],
                                cartAnimationMethod: itemSelectedCartAnimations,
                              );
                            },
                          ),
                        )
                      : GridView.count(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          physics: const BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 9 / 11.5,
                          children: List.generate(
                            6,
                            (index) => CustomShimmer(
                              height: double.infinity,
                              width: double.infinity,
                              borderRadius:
                                  BorderRadius.circular(tBorderRadiusGrid),
                            ),
                          ),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
