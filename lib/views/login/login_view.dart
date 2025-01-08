import 'package:dsw51765/services/shared_preferences_service.dart';
import 'package:dsw51765/utils/extensions.dart';
import 'package:dsw51765/utils/my_colors.dart';
import 'package:dsw51765/utils/my_images.dart';
import 'package:dsw51765/views/notes/notes_view.dart';
import 'package:dsw51765/views/register/register_view.dart';
import 'package:dsw51765/views/widgets/basic_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _emailErrorMessage;
  String? _passwordErrorMessage;

  static const String correctEmail = 'user@example.com';
  static const String correctPassword = 'password';


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  Future<void> _validateAndLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    setState(() {
      _emailErrorMessage = null;
      _passwordErrorMessage = null;

      if (email.isEmpty) {
        _emailErrorMessage = ' Email nie może być pusty';
      } else if (email != correctEmail) {
        _emailErrorMessage = 'Nieprawidłowy adres email';
      }

      if (password.isEmpty) {
        _passwordErrorMessage = 'Hasło nie może być puste';
      } else if (password != correctPassword) {
        _passwordErrorMessage = ' Nieprawidłowe hasło';
      }
    });

    if (_emailErrorMessage == null && _passwordErrorMessage == null) {
      await SharedPrefsHelper.getLoginStatus(true);
      await Navigator.pushReplacement(
        context,
        CupertinoPageRoute<NotesView>(
          builder: (context) => const NotesView(),
        ),
      );
    }
  }// Correct password




  @override
  Widget build(BuildContext context) {
    Extensions.width(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 62),
                Image.asset(MyImages.logo),
                const SizedBox(height: 21),
                _signInText,
                const SizedBox(height: 46),
                BasicTextFormField(
                  hintText: 'Email',
                  icon: Image.asset(MyImages.email),
                  controller: _emailController,
                ),
                if (_emailErrorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _emailErrorMessage!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                _size,
                BasicTextFormField(
                  hintText: 'Password',
                  obscureText: true,
                  isObscured: true,
                  icon: Image.asset(MyImages.password),
                  controller: _passwordController,
                ),
                if (_passwordErrorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _passwordErrorMessage!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                _size,
                _passwordText,
                _size,
                ElevatedButton(
                  onPressed: _validateAndLogin,
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
                const SizedBox(height: 200),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _accountText,
                    const SizedBox(width: 4),
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
      ),
    );
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
}
