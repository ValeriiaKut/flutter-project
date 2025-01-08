import 'package:dsw51765/services/shared_preferences_service.dart';
import 'package:dsw51765/views/login/login_view.dart';
import 'package:dsw51765/views/notes/notes_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: SplashScreen(),
  ),);
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final isLoggedIn = await SharedPrefsHelper.getLoginStatus(true);
    print('SplashScreen: Login status: $isLoggedIn');

    if (isLoggedIn) {

      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NotesView()),
      );
    } else {

      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}


