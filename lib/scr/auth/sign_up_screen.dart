import 'package:flutter/material.dart';
import 'package:quitanda/scr/constants/colors.dart';
import 'package:quitanda/scr/constants/sizes.dart';
import 'package:quitanda/scr/constants/texts.dart';

import '../components/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: tPrimaryColors,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              const Expanded(
                child: Center(
                  child: Text(
                    tTitleAccount,
                    style: TextStyle(
                        color: tPrimaryColorsTextLight,
                        fontSize: tFontSizeHeader,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              // Form
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: const BoxDecoration(
                  color: tPrimaryBackGround,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
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
                      const CustomTextField(
                        icon: Icons.person_outlined,
                        label: tFullName,
                      ),
                      const CustomTextField(
                        icon: Icons.phone_outlined,
                        label: tPhone,
                      ),
                      const CustomTextField(
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
                            tSaveAccount,
                            style: TextStyle(
                              fontSize: tFontSizeButton,
                              color: tPrimaryColorsTextLight,
                            ),
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
