import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitanda/scr/constants/texts.dart';

import '../../components/custom_text_field.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import 'package:quitanda/scr/constants/app_data.dart' as app_data;

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final phoneFormatter = MaskTextInputFormatter(
    mask: '(##) # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Column(
            children: [
              CustomTextField(
                initialValue: app_data.user.password,
                isSecret: true,
                icon: Icons.lock_outlined,
                label: tPasswordOld,
              ),

              CustomTextField(
                initialValue: app_data.user.password,
                isSecret: true,
                icon: Icons.lock_outlined,
                label: tPasswordNew,
              ),

              CustomTextField(
                initialValue: app_data.user.password,
                isSecret: true,
                icon: Icons.lock_outlined,
                label: tPasswordNewConfirm,
              ),

            ],
          ),
        );
      },
    );
  }

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
          CustomTextField(
            initialValue: app_data.user.email,
            icon: Icons.email_outlined,
            label: tEmail,
          ),
          CustomTextField(
            readOnly: true,
            initialValue: app_data.user.name,
            icon: Icons.person_outlined,
            label: tFullName,
          ),
          CustomTextField(
            readOnly: true,
            initialValue: app_data.user.phone,
            inputFormatters: [phoneFormatter],
            icon: Icons.phone_outlined,
            label: tPhone,
          ),
          CustomTextField(
            readOnly: true,
            initialValue: app_data.user.cpf,
            inputFormatters: [cpfFormatter],
            icon: Icons.file_copy_outlined,
            label: tCPF,
          ),
          SizedBox(
            height: tHeightSizeBox,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(tBorderRadius))),
              onPressed: () {
                updatePassword();
              },
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
