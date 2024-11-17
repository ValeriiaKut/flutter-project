import 'package:dsw51765/utils/my_colors.dart';
import 'package:dsw51765/utils/my_images.dart';
import 'package:dsw51765/views/register/register_view.dart';
import 'package:dsw51765/views/widgets/basic_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 62,
              ),
              Image.asset(
                MyImages.logo,
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 21,
                ),
                _signInText,
              ],
            ),
              const SizedBox(
                height: 46,
              ),
            BasicTextFormField(
                hintText: 'Email or User Name',
              icon: Image.asset(
                MyImages.name,
              ), onToggleObscure: () {  },
            ),
              _size,
              BasicTextFormField(
                hintText: 'Password',
                obcsureText: true,
                icon: Image.asset(
                  MyImages.password,
                ), onToggleObscure: () {
              },
              ),
              _size,
              _passwordText,
              _size,
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(390, 50),
                  backgroundColor: MyColors.lilacColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      color: MyColors.whiteColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _accountText,
              const SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute<RegisterView>(
                      builder: (context) => const RegisterView(),
                    ),
                  );
                },
                child: _signUpText,
              ),
            ],
          ),
        ],
      ),
    ),
    ),
    );
  }
}

Widget get _signInText {
  return Padding(
    padding: const EdgeInsets.only(left: 19),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Sign in',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: MyColors.purpleColor,
        ),
      ),
    ),
  );
}


Widget get _passwordText {
  return Padding(
    padding: const EdgeInsets.only(right: 19),
    child: Align(
      alignment: Alignment.centerRight,
      child: Text(
        'Forget Password?',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: MyColors.purpleColor,
        ),
      ),
    ),
  );
}


Widget get _signUpText {
  return Text(
    'Sign Up',
    style: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: MyColors.purpleColor,
    ),
  );
}

Widget get _accountText {
  return Text(
    "Don't have an account ?",
    style: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: MyColors.purpleColor,
    ),
  );
}

Widget get _size {
  return const SizedBox(
    height: 40,
  );
}