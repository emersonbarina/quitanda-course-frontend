import 'package:flutter/material.dart';
import 'package:quitanda/scr/components/quantity_widget.dart';
import 'package:quitanda/scr/constants/colors.dart';
import 'package:quitanda/scr/constants/sizes.dart';
import 'package:quitanda/scr/models/cart_item_model.dart';
import 'package:quitanda/scr/services/utils_services.dart';

class CartTile extends StatelessWidget {
  CartTile({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final CartItemModel cartItem;

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(tBorderRadius),
      ),
      child: ListTile(
        // Image
        leading: Image.asset(
          cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),
        //Title
        title: Text(
          cartItem.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        // Total
        subtitle: Text(
          utilsServices.priceToCurrency(cartItem.totalPrice()),
          style: const TextStyle(
            color: tColorsPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),

        //Quantity
        trailing: QuantityWidget(
          suffixText: cartItem.item.unit,
          value: cartItem.quantity,
          result: (quantity) {},
          isRemovable: true,
        ),
      ),
    );
  }
}
