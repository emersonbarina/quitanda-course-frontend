import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quitanda/scr/constants/sizes.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final bool readOnly;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final TextInputType? keyBoardType;
  final GlobalKey<FormFieldState>? formFieldKey;


  const CustomTextField({
    Key? key,
    required this.icon,
    required this.label,
    this.isSecret = false,
    this.inputFormatters,
    this.initialValue,
    this.readOnly = false,
    this.validator,
    this.controller,
    this.keyBoardType,
    this.onSaved,
    this.formFieldKey,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: tSpacePadding),
      child: TextFormField(
        key: widget.formFieldKey,
        controller: widget.controller,
        readOnly: widget.readOnly,
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatters,
        validator: widget.validator,
        onSaved: widget.onSaved,
        keyboardType: widget.keyBoardType,
        obscureText: isObscure,
        decoration: InputDecoration(
            prefixIcon: Icon(widget.icon),
            suffixIcon: widget.isSecret
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(isObscure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                  )
                : null,
            labelText: widget.label,
            isDense: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(tBorderRadius))),
      ),
    );
  }
}
