import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quitanda/scr/components/custom_text_field.dart';
import 'package:quitanda/scr/constants/sizes.dart';
import 'package:quitanda/scr/constants/texts.dart';
import 'package:quitanda/scr/page_route/app_pages.dart';
import 'package:quitanda/scr/pages/auth/controller/auth_controller.dart';
import '../../../components/app_name_widget.dart';
import '../../../constants/colors.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  // Controllers Fields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.orange,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // AppName
                    const AppNameWidget(
                      fontWeight: FontWeight.bold,
                      textSize: tFontSizeHeader,
                      colorAppTitleColor: tColorsLight,
                    ),

                    // Category
                    SizedBox(
                      height: 30,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                        child: AnimatedTextKit(
                          pause: Duration.zero,
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText('Frutas'),
                            FadeAnimatedText('Verduras'),
                            FadeAnimatedText('Legumes'),
                            FadeAnimatedText('Carnes'),
                            FadeAnimatedText('Bebidas'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Form
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
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
                        controller: emailController,
                        icon: Icons.email_outlined,
                        label: tEmail,
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return tValidEmailEmpty;
                          }
                          if (!email.isEmail) return tValidEmail;
                          return null;
                        },
                      ),
                      CustomTextField(
                        controller: passwordController,
                        isSecret: true,
                        icon: Icons.lock_outlined,
                        label: tPassword,
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return tValidPassEmpty;
                          }
                          if (password.length < 7) return tValidPassLength;
                          return null;
                        },
                      ),

                      // Login Button
                      SizedBox(
                        height: tHeightSizeBox,
                        child: GetX<AuthController>(
                          builder: (authController) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          tBorderRadius))),
                              onPressed: authController.isLoading.value
                                  ? null
                                  : () {
                                      FocusScope.of(context).unfocus();
                                      if (_formKey.currentState!.validate()) {
                                        String email = emailController.text;
                                        String password =
                                            passwordController.text;

                                        authController.signIn(
                                            email: email, password: password);

                                        print('Email: $email - Senha: $password');
                                      } else {
                                        print('Há campos inválidos!');
                                      }
                                      //Get.toNamed(PageRoutes.baseRoute);
                                    },
                              child: authController.isLoading.value
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      tLogin,
                                      style: TextStyle(
                                        fontSize: tFontSizeButton,
                                        color: tColorsLight,
                                      ),
                                    ),
                            );
                          },
                        ),
                      ),

                      // Forget Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('Esqueceu a senha?'),
                        ),
                      ),

                      // Divisor
                      Padding(
                        padding: const EdgeInsets.only(bottom: tSpacePadding),
                        child: Row(
                          children: const [
                            Expanded(
                              child: Divider(
                                thickness: 2,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: tSpacePadding),
                              child: Text('Ou'),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // New account
                      SizedBox(
                        height: tHeightSizeBox,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(tBorderRadius),
                            ),
                            side: const BorderSide(
                              width: 2,
                              color: tColorsPrimary,
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed(PageRoutes.signUpRoute);
                          },
                          child: const Text(
                            'Criar conta',
                            style: TextStyle(fontSize: tFontSizeButton),
                          ),
                        ),
                      ),
                    ],
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
