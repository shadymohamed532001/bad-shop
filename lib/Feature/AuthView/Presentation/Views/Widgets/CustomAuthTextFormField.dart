// ignore_for_file: must_be_immutable

import 'package:bag/AppManager/ColorMangager.dart';
import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    required this.hintText,
    this.maxLine = 1,
    this.filled,
    this.fillColor,
    this.controller,
    required this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.validator,
  });

  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String hintText;
  final int? maxLine;
  final bool obscureText;
  final bool? filled;
  final TextEditingController? controller;
  final Color? fillColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16)
          .copyWith(top: 12, bottom: 8),
      child: TextFormField(
        onTapOutside: (Event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        maxLines: maxLine,
        obscureText: obscureText,
        keyboardType: keyboardType,
        controller: controller,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          suffixIconColor: const Color.fromARGB(255, 101, 98, 98),
          prefixIcon: prefixIcon,
          filled: true,
          fillColor: ColorManger.greyColorBackGround,
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
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.w400),
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
      color: ColorManger.primaryColor,
    ),
  );
}
