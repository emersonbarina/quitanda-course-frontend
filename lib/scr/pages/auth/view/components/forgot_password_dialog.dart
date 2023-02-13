import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/scr/constants/colors.dart';
import 'package:quitanda/scr/constants/sizes.dart';
import 'package:quitanda/scr/constants/texts.dart';
import 'package:quitanda/scr/pages/auth/controller/auth_controller.dart';

import '../../../../components/custom_text_field.dart';
import '../../../../services/validators.dart';


class ForgotPasswordDialog extends StatelessWidget {
  final emailController = TextEditingController();

  ForgotPasswordDialog({
    required String email,
    Key? key,
  }) : super(key: key) {
    emailController.text = email;
  }

  final _formFieldKey = GlobalKey<FormFieldState>();

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(tBorderRadius),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Conteúdo
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Titulo
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    tRecoverPassword,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),

                // Descrição
                const Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 20,
                  ),
                  child: Text(
                    tRecoverYourEmail,
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                ),

                // Campo de email
                CustomTextField(
                  formFieldKey: _formFieldKey,
                  controller: emailController,
                  icon: Icons.email,
                  label: tEmail,
                  validator: emailValidator,
                ),

                // Confirmar
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(tBorderRadius),
                    ),
                    side: const BorderSide(
                      width: 2,
                      color: tColorsPrimary,
                    ),
                  ),
                  onPressed: () {
                    if(_formFieldKey.currentState!.validate()){

                      authController.resetPassword(emailController.text);
                      Get.back(result: true);

                    }
                  },
                  child: const Text(
                    tRecover,
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Botão para fechar
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}
