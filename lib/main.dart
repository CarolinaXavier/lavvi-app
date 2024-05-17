import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavvi_app/app_injection/app_injection.dart';
import 'package:lavvi_app/core/env/env.dart';
import 'package:lavvi_app/guards/auth_middleware.dart';
import 'package:lavvi_app/pages/home_page.dart';
import 'package:lavvi_app/pages/login_page.dart';
import 'package:lavvi_app/pages/register_page.dart';
import 'package:get/get.dart';

import 'core/storage/storage.dart';

void main() async {
  await Env.instance.load();
  //Get.put(AuthMiddleware());
  setupProviders();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: const BorderSide(
      color: Color.fromRGBO(119, 119, 119, 1),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      // routes: {
      //   '/': (BuildContext context) => const LoginPage(),
      //   '/register-page': (BuildContext context) => const RegisterPage(), 
      //   '/home-page': (BuildContext context) => const RegisterPage(),
      // },
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const LoginPage(),
        ),
        GetPage(name: '/login-page', page: () => const LoginPage()),
        GetPage(name: '/register-page', page: () => const RegisterPage()),
        GetPage(name: '/home-page', page: () => const HomePage()),
      ],
    );
  }
}
