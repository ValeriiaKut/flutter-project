import 'package:dsw51765/utils/my_colors.dart';
import 'package:dsw51765/utils/my_images.dart';
import 'package:flutter/material.dart';

class BasicTextFormField extends StatefulWidget {
  final String initialValue;
  final String hintText;
  final bool obscureText;
  final bool isObscured;
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 5e9919f9586b26b1f6ee90e99a3c5c99cc26c8d7
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
<<<<<<< HEAD
=======
=======
  final Widget? icon;

  const BasicTextFormField(
      { super.key,
        this.intalialValue = '',
        this.hintText = '',
        this.obcsureText = false,
        this.isObscured = false,
        this.icon,}
      );
>>>>>>> 936de1ada430b200f6a57d0152f92c30007f8dea
>>>>>>> 5e9919f9586b26b1f6ee90e99a3c5c99cc26c8d7

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390,
      height: 50,
      child: TextFormField(
<<<<<<< HEAD
        obscureText: obscureText,
        initialValue: widget.initialValue,
=======
<<<<<<< HEAD
        obscureText: _obscureText, // Use the dynamic state of obscureText
        initialValue: widget.intalialValue,
=======
        obscureText: obcsureText,
        initialValue: intalialValue,
>>>>>>> 936de1ada430b200f6a57d0152f92c30007f8dea
>>>>>>> 5e9919f9586b26b1f6ee90e99a3c5c99cc26c8d7
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: MyColors.grayColor,
          ),
<<<<<<< HEAD
          prefixIcon: widget.icon,
=======
<<<<<<< HEAD
          prefixIcon: widget.icon, // Custom left icon
=======
          prefixIcon: icon,
>>>>>>> 936de1ada430b200f6a57d0152f92c30007f8dea
>>>>>>> 5e9919f9586b26b1f6ee90e99a3c5c99cc26c8d7
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
