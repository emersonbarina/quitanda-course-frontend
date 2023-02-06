import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/texts.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({
    Key? key,
    this.colorAppTitleColor,
    this.textSize = 30,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  final Color? colorAppTitleColor;
  final double textSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: textSize,
          fontWeight: fontWeight,
        ),
        children: [
          TextSpan(
            text: tAppTitle1,
            style: TextStyle(
              color: colorAppTitleColor ?? tColorsPrimary,
            ),
          ),
          const TextSpan(
            text: tAppTitle2,
            style: TextStyle(
              color: tColorsDark,
            ),
          ),
        ],
      ),
    );
  }
}
