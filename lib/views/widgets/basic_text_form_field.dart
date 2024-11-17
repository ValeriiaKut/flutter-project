import 'package:dsw51765/utils/my_colors.dart';
import 'package:flutter/material.dart';


class BasicTextFormField extends StatelessWidget {
  final String intalialValue;
  final String hintText;
  final bool obcsureText;
  final bool isObscured;
  final VoidCallback onToggleObscure;
  final Widget? icon;

  const BasicTextFormField(
      {required this.onToggleObscure, super.key,
        this.intalialValue = '',
        this.hintText = '',
        this.obcsureText = false,
        this.isObscured = false,
        this.icon,}
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390,
      height: 50,
      child: TextFormField(
        obscureText: obcsureText && isObscured,
        initialValue: intalialValue,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: MyColors.grayColor,
          ),
          prefixIcon: icon,
          suffixIcon: obcsureText
              ? IconButton(
            icon: Icon(
              isObscured ? Icons.visibility_off : Icons.visibility,
              color: MyColors.grayColor,
            ),
            onPressed: onToggleObscure,
          )
              : null,
          contentPadding: const EdgeInsets.only(left: 20, right: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: MyColors.violetColor,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: MyColors.violetColor,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: MyColors.violetColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
