import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitanda/scr/constants/colors.dart';
import 'package:quitanda/scr/constants/sizes.dart';
import 'package:quitanda/scr/constants/texts.dart';

import '../../../components/custom_text_field.dart';
import '../../../services/validators.dart';
import '../controller/auth_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );
  final phoneFormatter = MaskTextInputFormatter(
    mask: '(##) # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final _formKey = GlobalKey<FormState>();

  // prepare to receive data on saved
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: tColorsPrimary,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  // Header
                  const Expanded(
                    child: Center(
                      child: Text(
                        tTitleAccount,
                        style: TextStyle(
                            color: tColorsLight,
                            fontSize: tFontSizeHeader,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  // Form
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 40),
                    decoration: const BoxDecoration(
                      color: tColorsPrimaryBackGround,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(tBorderRadiusCircular)),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Text Field e Button Login
                          CustomTextField(
                            icon: Icons.email_outlined,
                            label: tEmail,
                            onSaved: (value) {
                              authController.user.email = value;
                            },
                            keyBoardType: TextInputType.emailAddress,
                            validator: emailValidator,
                          ),
                          CustomTextField(
                            isSecret: true,
                            icon: Icons.lock_outlined,
                            label: tPassword,
                            onSaved: (value) {
                              authController.user.password = value;
                            },
                            validator: passwordValidator,
                          ),
                          CustomTextField(
                            icon: Icons.person_outlined,
                            label: tFullName,
                            onSaved: (value) {
                              authController.user.name = value;
                            },
                            validator: nameValidator,
                          ),
                          CustomTextField(
                            inputFormatters: [phoneFormatter],
                            icon: Icons.phone_outlined,
                            label: tPhone,
                            keyBoardType: TextInputType.phone,
                            onSaved: (value) {
                              authController.user.phone = value;
                            },
                            validator: phoneValidator,
                          ),
                          CustomTextField(
                            inputFormatters: [cpfFormatter],
                            icon: Icons.file_copy_outlined,
                            label: tCPF,
                            keyBoardType: TextInputType.number,
                            onSaved: (value) {
                              authController.user.cpf = value;
                            },
                            validator: cpfValidator,
                          ),
                          SizedBox(
                            height: tHeightSizeBox,
                            child: Obx(
                              () {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              tBorderRadius))),
                                  onPressed: authController.isLoading.value
                                      ? null
                                      : () {
                                          FocusScope.of(context).unfocus();
                                          if (_formKey.currentState!
                                              .validate()) {
                                            // Success
                                            _formKey.currentState!.save();
                                            authController.signUp();
                                          }
                                        },
                                  child: authController.isLoading.value
                                      ? const CircularProgressIndicator()
                                      : const Text(
                                          tSaveAccount,
                                          style: TextStyle(
                                            fontSize: tFontSizeButton,
                                            color: tColorsLight,
                                          ),
                                        ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: tColorsPrimaryBackGround,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
