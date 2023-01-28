import 'package:flutter/material.dart';
import 'package:quitanda/scr/constants/colors.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: tColorsLight,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          )
        ],
      ),
      child: Row(
        children: [
          Material(
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: 50,
                decoration:
                    const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                child: const Icon(
                  Icons.remove_outlined,
                  color: tColorsLight,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
