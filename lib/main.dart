import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavvi_app/pages/home_page.dart';
import 'package:lavvi_app/pages/login_page.dart';
import 'package:lavvi_app/pages/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: const BorderSide(
      color: Color.fromRGBO(119, 119, 119, 1),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lavvi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: GoogleFonts.philosopher(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            color: const Color.fromRGBO(119, 119, 119, 1),
          ),
          border: border,
          enabledBorder: border,
          disabledBorder: border,
          focusedErrorBorder: border,
        ),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const LoginPage(),
        '/register-page':(context) => const RegisterPage(),
        '/home-page':(context) => const HomePage(),
      },
    );
  }
}
