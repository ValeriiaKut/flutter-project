import 'package:dsw51765/utils/my_colors.dart';
import 'package:dsw51765/utils/my_images.dart'; // Assuming MyImages contains MyImages.eye and MyImages.eyeOff
import 'package:flutter/material.dart';

class BasicTextFormField extends StatefulWidget {
  final String intalialValue;
  final String hintText;
  final bool obcsureText;
  final bool isObscured;
  final Widget? icon; // For left side icon
  final Widget? prefixIcon;

  const BasicTextFormField({
    super.key,
    this.intalialValue = '',
    this.hintText = '',
    this.obcsureText = false,
    this.isObscured = false,
    this.icon, // Custom left side icon
    this.prefixIcon, // Custom prefix icon (if needed)
  });

  @override
  _BasicTextFormFieldState createState() => _BasicTextFormFieldState();
}

class _BasicTextFormFieldState extends State<BasicTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obcsureText; // Initialize the obscureText state
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390,
      height: 50,
      child: TextFormField(
        obscureText: _obscureText, // Use the dynamic state of obscureText
        initialValue: widget.intalialValue,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: MyColors.grayColor,
          ),
          prefixIcon: widget.icon, // Custom left icon
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
                _obscureText = !_obscureText; // Toggle password visibility
              });
            },
            child: const ImageIcon(
              AssetImage(
                MyImages.eye, // Toggle between eye and eyeOff
              ),
            ),
          )
              : widget.prefixIcon ?? const SizedBox(), // Default icon for other fields
        ),
      ),
    );
  }
}
