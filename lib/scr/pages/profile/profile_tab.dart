import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitanda/scr/constants/texts.dart';

import '../../components/custom_text_field.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';


class ProfileTab extends StatelessWidget {
  ProfileTab({Key? key}) : super(key: key);

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );
  final phoneFormatter = MaskTextInputFormatter(
    mask: '(##) # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          tProfile,
          style: TextStyle(
            color: tColorsLight,
            fontSize: tFontSizeAppBar,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout_outlined,
              color: tColorsLight,
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          const CustomTextField(
            icon: Icons.email_outlined,
            label: tEmail,
          ),
          const CustomTextField(
            isSecret: true,
            icon: Icons.lock_outlined,
            label: tPassword,
          ),
          const CustomTextField(
            icon: Icons.person_outlined,
            label: tFullName,
          ),
          CustomTextField(
            inputFormatters: [phoneFormatter],
            icon: Icons.phone_outlined,
            label: tPhone,
          ),
          CustomTextField(
            inputFormatters: [cpfFormatter],
            icon: Icons.file_copy_outlined,
            label: tCPF,
          ),
          SizedBox(
            height: tHeightSizeBox,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(tBorderRadius))),
              onPressed: () {},
              child: const Text(
                tProfileSave,
                style: TextStyle(
                  fontSize: tFontSizeButton,
                  color: tColorsLight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
