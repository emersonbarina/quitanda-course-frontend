import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quitanda/scr/components/custom_text_field.dart';
import 'package:quitanda/scr/constants/sizes.dart';
import 'package:quitanda/scr/constants/texts.dart';
import 'package:quitanda/scr/pages/auth/sign_up_screen.dart';

import '../../constants/colors.dart';
import '../base/base_screen.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

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
                    const Text.rich(
                      TextSpan(
                        style: TextStyle(fontSize: tFontSizeHeader),
                        children: [
                          TextSpan(
                            text: tAppTitle1,
                            style: TextStyle(
                              color: tColorsLight,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: tAppTitle2,
                            style: TextStyle(
                              color: tColorsDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
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
                  borderRadius: BorderRadius.vertical(top: Radius.circular(tBorderRadiusCircular)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Text Field e Button Login
                    const CustomTextField(
                      icon: Icons.email_outlined,
                      label: tEmail,
                    ),
                    const CustomTextField(
                      isSecret: true,
                      icon: Icons.lock_outlined,
                      label: tPassword,
                    ),

                    // Login Button
                    SizedBox(
                      height: tHeightSizeBox,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(tBorderRadius))),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (c) {
                              return const BaseScreen();
                            }),
                          );
                        },
                        child: const Text(
                          tLogin,
                          style: TextStyle(
                            fontSize: tFontSizeButton,
                            color: tColorsLight,
                          ),
                        ),
                      ),
                    ),

                    // Forget Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {

                        },
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
                            padding:
                                EdgeInsets.symmetric(horizontal: tSpacePadding),
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
                            borderRadius: BorderRadius.circular(tBorderRadius),
                          ),
                          side: const BorderSide(
                            width: 2,
                            color: tColorsPrimary,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (c) {
                              return SignUpScreen();
                            }),
                          );
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
            ],
          ),
        ),
      ),
    );
  }
}
