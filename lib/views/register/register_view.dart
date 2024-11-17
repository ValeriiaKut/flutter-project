import 'package:dsw51765/utils/my_colors.dart';
import 'package:dsw51765/utils/my_images.dart';
import 'package:dsw51765/views/login/login_view.dart';
import 'package:dsw51765/views/widgets/basic_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                MyImages.elipse,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute<RegisterView>(
                    builder: (context) => const LoginView(),
                  ),
                );
              },
              child: _backText,
            ),
            const SizedBox(
              height: 104,
            ),
            _signUpText,
            const SizedBox(
              height: 46,
            ),
            BasicTextFormField(
              hintText: 'Full Name',
              icon: Image.asset(
                MyImages.name,
              ), onToggleObscure: () {  },
            ),
            _size,
            BasicTextFormField(
              hintText: 'Email',
              icon: Image.asset(
                MyImages.email,
              ), onToggleObscure: () {  },
            ),
            _size,
            BasicTextFormField(
              hintText: 'Password',
              obcsureText: true,
              icon: Image.asset(
                MyImages.password,
              ), onToggleObscure: () {  },
            ),
            _size,
            BasicTextFormField(
              hintText: 'Confirm Password',
              obcsureText: true,
              icon: Image.asset(
                MyImages.password,
              ), onToggleObscure: () {  },
            ),
            const SizedBox(
              height: 80,
            ),
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
                  'Sign Up',
                  style: TextStyle(
                    color: MyColors.whiteColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _accountText,
            const SizedBox(
              width: 3,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute<RegisterView>(
                    builder: (context) => const LoginView(),
                  ),
                );
              },
              child: _signInText,
            ),
          ],
        ),
      ],),),
    );
  }
}

Widget get _signUpText {
  return Padding(
    padding: const EdgeInsets.only(left: 20),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Sign Up',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: MyColors.purpleColor,
        ),
      ),
    ),
  );
}


Widget get _signInText {
  return Text(
    'Sign In',
    style: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: MyColors.purpleColor,
    ),
  );
}

Widget get _accountText {
  return Text(
    'Already have account ?',
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


Widget get _backText {
  return Padding(
    padding: const EdgeInsets.only(left: 32),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Back',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: MyColors.purpleColor,
        ),
      ),
    ),
  );
}



