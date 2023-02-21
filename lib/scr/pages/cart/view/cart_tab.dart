import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/scr/constants/colors.dart';
import 'package:quitanda/scr/constants/sizes.dart';
import 'package:quitanda/scr/constants/texts.dart';
import 'package:quitanda/scr/pages/cart/controller/cart_controller.dart';
import 'package:quitanda/scr/pages/cart/view/widgets/cart_tile.dart';
import 'package:quitanda/scr/services/utils_services.dart';

import 'package:quitanda/scr/constants/app_data.dart' as app_data;

import '../../../components/payment_dialog.dart';

class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();

  Future<bool?> showOrderConfirmation() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(tOrderConfirmationDialogTitle),
          content: const Text(tOrderConfirmationDialogMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text(tOrderConfirmationDialogNo),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text(tOrderConfirmationDialogYes),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          tNavCart,
          style: TextStyle(
            color: tColorsLight,
            fontSize: tFontSizeAppBar,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartController>(builder: (controller) {
              if (controller.cartItems.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.remove_shopping_cart,
                      size: 40,
                      color: tColorsPrimary,
                    ),
                    Text(tCartNoItems),
                  ],
                );
              } else {
                return ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (_, index) {
                    return CartTile(
                      cartItem: controller.cartItems[index],
                    );
                  },
                );
              }
            }),
          ),
          Container(
            //height: 150,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: tColorsLight,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(tBorderRadiusCircular),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 3,
                    spreadRadius: 2),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  tTotalCart,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                GetBuilder<CartController>(builder: (controller) {
                  return Text(
                    utilsServices.priceToCurrency(controller.cartTotalPrice()),
                    style: const TextStyle(
                      fontSize: 23,
                      color: tColorsPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
                SizedBox(
                  height: tHeightSizeBox,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(tBorderRadius))),
                    onPressed: () async {
                      bool? result = await showOrderConfirmation();

                      if (result ?? false) {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return PaymentDialog(
                              order: app_data.orders.first,
                            );
                          },
                        );
                      } else {
                        utilsServices.showToast(
                            message: 'Pedido não finalizado', isError: true);
                      }
                    },
                    label: const Text(
                      tFinishOrder,
                      style: TextStyle(
                        color: tColorsLight,
                        fontSize: tFontSizeButton,
                      ),
                    ),
                    icon: const Icon(
                      Icons.check_outlined,
                      color: tColorsLight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
