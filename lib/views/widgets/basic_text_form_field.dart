import 'package:dsw51765/utils/my_colors.dart';
import 'package:dsw51765/utils/my_images.dart';
import 'package:flutter/material.dart';

class BasicTextFormField extends StatefulWidget {
  final String initialValue;
  final String hintText;
  final bool obscureText;
  final bool isObscured;
  final Widget? icon; // For left side icon
  final Widget? prefixIcon;

  const BasicTextFormField({
    super.key,
    this.initialValue = '',
    this.hintText = '',
    this.obscureText = false,
    this.isObscured = false,
    this.icon, // Custom left side icon
    this.prefixIcon, // Custom prefix icon (if needed)
  });

  @override
  _BasicTextFormFieldState createState() => _BasicTextFormFieldState();
}

class _BasicTextFormFieldState extends State<BasicTextFormField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText; // Initialize the obscureText state
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390,
      height: 50,
      child: TextFormField(
        obscureText: obscureText,
        initialValue: widget.initialValue,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: MyColors.grayColor,
          ),
          prefixIcon: widget.icon,
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
          suffixIcon: widget.isObscured
              ? GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: ImageIcon(
              AssetImage(
                obscureText ? MyImages.eye : MyImages.eye,
              ),
            ),
          )
              : widget.prefixIcon ?? const SizedBox(),
        ),
      ),
    );
  }
}
