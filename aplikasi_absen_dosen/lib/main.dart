import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../pages/forgotpassword.dart';
import '../pages/homePage.dart';
import '../pages/loginPage.dart';
import '../pages/Register.dart';
import '../pages/home.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      routes: {
        '/start': (context) => const Home(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const Register(),
        '/reset': (context) => ForgotPasswordPage(),
        '/homepage': (context) => const HomePage(),

      },
    );
  }
}
