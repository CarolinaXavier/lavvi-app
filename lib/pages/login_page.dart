import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavvi_app/app_injection/app_injection.dart';
import 'package:lavvi_app/components/elevated_button_component.dart';
import 'package:lavvi_app/controllers/login_controller.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final controller = getIt<LoginController>();

  String textbuttonError = 'Não autorizado';
  bool isObscureText = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                    child: Image.asset(
                      'assets/images/logo.png',
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
              padding: const EdgeInsets.only(
                  left: 16, top: 40, right: 16, bottom: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        label: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'nome de usuário ou e-mail',
                          ),
                        ),
                      ),
                      textAlign: TextAlign.center,
                      validator: Validatorless.multiple([
                        Validatorless.email('E-mail Inválido'),
                        Validatorless.required('E-mail Obrigatório'),
                      ]),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        label: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Senha',
                          ),
                        ),
                         suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          icon: Icon(
                           isObscureText ? Icons.visibility_off : Icons.visibility,
                            size: 19,
                          ),
                        ),
                      ),
                      obscureText: isObscureText,
                      textAlign: TextAlign.center,
                      validator: Validatorless.multiple([
                        Validatorless.min(4, 'O mínimo de caracteres é 4'),
                        Validatorless.required('Senha Obrigatória'),
                      ]),
                    ),
                    const SizedBox(height: 24),
                    ScopedBuilder(
                      store: controller,
                      onLoading: (context) {
                        return const ElevatedButtonComponent(
                          label: '',
                          onPressed: null,
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                      onError: (context, error) {
                        Future.delayed(
                          const Duration(seconds: 2),
                          () {
                            textbuttonError = 'Tente novamente';
                            setState(() {});
                          },
                        );

                        return ElevatedButtonComponent(
                          label: textbuttonError,
                          color: Colors.red.shade600,
                          onPressed: () => isFormValid(),
                        );
                      },
                      onState: (context, state) {
                        return ElevatedButtonComponent(
                          label: 'ENTRAR',
                          onPressed: () => isFormValid(),
                        );
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
                        style: const TextStyle(
                            fontSize: 16, color: Color.fromRGBO(14, 27, 43, 1)),
                        children: [
                          TextSpan(
                            text: ' clique aqui',
                            style: const TextStyle(
                              color: Color.fromRGBO(131, 129, 88, 1),
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed('/register-page');
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  isFormValid() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
     await getIt<LoginController>().login(emailController.text, passwordController.text, context);
    }
  }
}
