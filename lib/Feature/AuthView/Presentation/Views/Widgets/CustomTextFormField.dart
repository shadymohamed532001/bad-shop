// ignore_for_file: must_be_immutable

import 'package:bag/Core/Uitls/MyTheme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class CustomTextFormField extends StatefulWidget {
  String hint;
  TextEditingController controller;
  TextInputType keyboardType;
  String? Function(String?)? validator;
  bool isPassword;
  // static bool isPassword = false  ;
  Widget? suffixIcon;

  CustomTextFormField(
      {super.key,
      required this.hint,
      required this.keyboardType,
      required this.controller,
      required this.validator,
      this.suffixIcon,
      this.isPassword = false});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isShown = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        obscureText: !isShown,
        controller: widget.controller,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: isShown
                      ? const FaIcon(FontAwesomeIcons.eye)
                      : const FaIcon(FontAwesomeIcons.eyeSlash),
                  onPressed: () {
                    setState(
                      () {
                        isShown = !isShown;
                      },
                    );
                  },
                )
              : null,
          fillColor: MyTheme.greyColorBackGround,
          filled: true,
          hintText: widget.hint,
          hintStyle: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.w400),
          enabledBorder: buildOutlineInputBorder(
            width: 1,
          ),
          focusedBorder: buildOutlineInputBorder(
            width: 2,
          ),
          errorBorder: buildOutlineInputBorder(
            width: 2,
          ),
          focusedErrorBorder: buildOutlineInputBorder(
            width: 2,
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder buildOutlineInputBorder({required double width}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(18),
    borderSide: BorderSide(
      width: width,
      color: MyTheme.primaryColor,
    ),
  );
}
