import 'package:flutter/material.dart';
import 'package:quitanda/scr/components/quantity_widget.dart';
import 'package:quitanda/scr/constants/colors.dart';
import 'package:quitanda/scr/constants/texts.dart';
import 'package:quitanda/scr/models/item_model.dart';
import 'package:quitanda/scr/pages/cart/controller/cart_controller.dart';

import 'package:quitanda/scr/services/utils_services.dart';
import '../../constants/sizes.dart';
import 'package:get/get.dart';

import '../base/controller/navigation_controller.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({
    Key? key,
  }) : super(key: key);

  final ItemModel item = Get.arguments;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final UtilsServices utilsServices = UtilsServices();

  final cartController = Get.find<CartController>();

  int cartItemQuantity = 1;
  final navigationController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          // Content
          Column(
            children: [
              // image
              Expanded(
                child: Hero(
                  tag: widget.item.imgUrl,
                  child: Image.network(widget.item.imgUrl),
                ),
              ),
              // information
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                      color: tColorsPrimaryBackGround,
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(tBorderRadiusCircular)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600,
                          offset: const Offset(0, 2),
                        ),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Name - Quantity
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.item.itemName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          QuantityWidget(
                            value: cartItemQuantity,
                            suffixText: widget.item.unit,
                            result: (int quantity) {
                              setState(() {
                                cartItemQuantity = quantity;
                              });
                            },
                          ),
                        ],
                      ),

                      // Price
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          utilsServices.priceToCurrency(widget.item.price),
                          style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: tColorsPrimary,
                          ),
                        ),
                      ),

                      // Description
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.item.description,
                              style: const TextStyle(height: 1.5),
                            ),
                          ),
                        ),
                      ),

                      // Add Cart Button
                      SizedBox(
                        height: tHeightSizeBox,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(tBorderRadius))),
                          onPressed: () {
                            // Close screen
                            Get.back();
                            // Add in CartItem
                            cartController.addItemToCart(
                                item: widget.item, quantity: cartItemQuantity);

                            // go Cart
                            navigationController
                                .navigationPageView(NavigationTabs.cart);
                          },
                          label: const Text(
                            tAddCart,
                            style: TextStyle(
                              color: tColorsLight,
                              fontSize: tFontSizeButton,
                            ),
                          ),
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
                            color: tColorsLight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
