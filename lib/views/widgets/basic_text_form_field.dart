import 'package:dsw51765/utils/my_colors.dart';
import 'package:dsw51765/utils/my_images.dart';
import 'package:flutter/material.dart';

class BasicTextFormField extends StatefulWidget {
  final String initialValue;
  final String hintText;
  final bool obscureText;
  final bool isObscured;
  final Widget? icon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;


  const BasicTextFormField({
    super.key,
    this.initialValue = '',
    this.hintText = '',
    this.obscureText = false,
    this.isObscured = false,
    this.icon,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.onChanged,
  });

  @override
  _BasicTextFormFieldState createState() => _BasicTextFormFieldState();
}

class _BasicTextFormFieldState extends State<BasicTextFormField> {
  late bool obscureText;
  String? errorMessage;

  static const String correctPassword = "123456";

  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText; // Initialize the obscureText state
  }

  void _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        errorMessage = 'Password cannot be empty';
      });
    } else if (value != correctPassword) {
      setState(() {
        errorMessage = 'Invalid password';
      });
    } else {
      setState(() {
        errorMessage = null; // Clear error message if valid
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 390,
          height: 50,
          child: TextFormField(
            controller: widget.controller,
            obscureText: obscureText,
            initialValue: widget.controller == null ? widget.initialValue : null,
            validator: widget.validator,
            onChanged: (value) {
              _validatePassword(value); // Validate password on change
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            },
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
        ),
        if (errorMessage != null) // Show error message if present
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
            child: Text(
              errorMessage!,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }
}
