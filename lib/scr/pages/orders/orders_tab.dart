import 'package:flutter/material.dart';
import 'package:quitanda/scr/constants/texts.dart';
import 'package:quitanda/scr/pages/orders/widgets/order_tile.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

import 'package:quitanda/scr/constants/app_data.dart' as app_data;

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          tNavOrder,
          style: TextStyle(
            color: tColorsLight,
            fontSize: tFontSizeAppBar,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (_, index) => const SizedBox(height: 10),
        itemCount: app_data.orders.length,
        itemBuilder: (_, index) => OrderTile(order: app_data.orders[index]),
      ),
    );
  }
}
