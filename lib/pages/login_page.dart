import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lavvi_app/components/elevated_button_component.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/images/background.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Gradiente
                      Positioned.fill(
                        top: 80,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.transparent, Colors.white],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Text(
                            'Meu',
                            style: GoogleFonts.philosopher(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 280),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SvgPicture.network(
                      'assets/images/logo.svg',
                      placeholderBuilder: (context) {
                        return const CircularProgressIndicator();
                      },
                      height: 35,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              'Bem vindo',
              style: GoogleFonts.philosopher(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 40, right: 16),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'nome de usuário ou e-mail',
                        ),
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Senha',
                        ),
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButtonComponent(
                    label: 'ENTRAR',
                    onPressed: () {
                      Navigator.pushNamed(context, '/home-page');
                    },
                  ),
                  const SizedBox(height: 60),
                  InkWell(
                    onTap: () {},
                    splashColor: Colors.transparent,
                    overlayColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    child: const Text(
                      'Esqueceu a senha?',
                      style: TextStyle(
                        color: Color.fromRGBO(131, 129, 88, 1),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      text: 'Primeiro acesso?',
                      style: const TextStyle(fontSize: 16),
                      children: [
                        TextSpan(
                          text: ' clique aqui',
                          style: const TextStyle(
                            color: Color.fromRGBO(131, 129, 88, 1),
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/register-page');
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
