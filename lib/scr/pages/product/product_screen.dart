import 'package:flutter/material.dart';
import 'package:quitanda/scr/constants/colors.dart';
import 'package:quitanda/scr/models/item_model.dart';

import '../../constants/sizes.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.item}) : super(key: key);

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(item.imgUrl),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: tColorsPrimaryBackGround,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(tBorderRadiusCircular)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    offset: const Offset(0, 2),
                  ),
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
