import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavvi_app/components/elevated_button_component.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'Cadastro',
              style: GoogleFonts.philosopher(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 40, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text(
                        'Nome completo',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text(
                        'CPF',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text(
                        'E-mail',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text(
                        'senha',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const SizedBox(
                    width: 230,
                    child: Text(
                      'Para sua segurança use no mínimo caracteres letras e números',
                      style: TextStyle(
                        color: Color.fromRGBO(119, 119, 119, 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 210,
                        child: Padding(
                          padding: EdgeInsets.only(top: 24),
                          child: Text(
                            'Ao concluir seu cadastro você concorda com nossos termos & politica de provacidade',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButtonComponent(
                        label: 'CADASTRAR',
                        onPressed: () {},
                      ),
                      const SizedBox(width: 8),
                      const Text('ou'),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side: const BorderSide(
                                color: Color.fromRGBO(51, 78, 97, 1),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(
                            color: Color.fromRGBO(51, 78, 97, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                 Align(
                  alignment: Alignment.center,
                   child: RichText(
                      text: TextSpan(
                        text: 'Já é cadastrado?',
                        style: const TextStyle(fontSize: 16),
                        children: [
                          TextSpan(
                            text: ' Entrar',
                            style: const TextStyle(
                              color: Color.fromRGBO(131, 129, 88, 1),
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/');
                              },
                          ),
                        ],
                      ),
                    ),
                 ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
