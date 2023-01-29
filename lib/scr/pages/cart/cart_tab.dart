import 'package:flutter/material.dart';
import 'package:quitanda/scr/constants/colors.dart';
import 'package:quitanda/scr/constants/sizes.dart';
import 'package:quitanda/scr/constants/texts.dart';
import 'package:quitanda/scr/services/utils_services.dart';

class CartTab extends StatelessWidget {
  CartTab({Key? key}) : super(key: key);

  final UtilsServices utilsServices = UtilsServices();

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
          const Expanded(
            child: Placeholder(),
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
                Text(
                  utilsServices.priceToCurrency(50.5),
                  style: const TextStyle(
                    fontSize: 23,
                    color: tColorsPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: tHeightSizeBox,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(tBorderRadius))),
                    onPressed: () {},
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
