import 'package:flutter/material.dart';
import 'package:quitanda/scr/constants/colors.dart';
import 'package:quitanda/scr/constants/sizes.dart';
import 'package:quitanda/scr/constants/texts.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

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
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            color: tColorsPrimary,
          ),
        ],
      ),

      // Campo de Pesquisa

      // Categorias

      // Grid
    );
  }
}
