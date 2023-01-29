import 'package:flutter/material.dart';
import 'package:quitanda/scr/constants/texts.dart';

class CartTab extends StatelessWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(tNavCart),
      ),
      body: Column(
        children: const [
          Expanded(
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
