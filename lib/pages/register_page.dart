import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavvi_app/app_injection/app_injection.dart';
import 'package:lavvi_app/components/elevated_button_component.dart';
import 'package:lavvi_app/controllers/register_controller.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final cpfController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool? isChecked = false;

  @override
  void dispose() {
    nameController.dispose();
    cpfController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              'Cadastro',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        label: Text(
                          'Nome completo',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      validator:
                          Validatorless.required('Nome de usuário Obrigatório'),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: cpfController,
                      decoration: const InputDecoration(
                        label: Text(
                          'CPF',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.cpf('CPF não é válido'),
                        Validatorless.required('CPF Obrigatório'),
                      ]),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        label: Text(
                          'E-mail',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.email('E-mail Inválido'),
                        Validatorless.required('E-mail Obrigatório'),
                      ]),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        label: Text(
                          'senha',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.min(4, 'O mínimo de caracteres é 4'),
                        Validatorless.required('Senha Obrigatória'),
                      ]),
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
                        Expanded(
                          child: ScopedBuilder(
                            store: getIt<RegisterController>(),
                            onError: (context, error) {
                              String message = error.message;
                              print('ERROR MESSAGE: $message');
                              if (message.contains('302')) {
                                return ElevatedButtonComponent(
                                  label: 'Cadastro falhou',
                                  color: Colors.red.shade600,
                                  onPressed: () {
                                    isFormValid();
                                  },
                                );
                              } else {
                                print('Error Message: $message');
                                return ElevatedButtonComponent(
                                  label: 'Login falhou',
                                  color: Colors.red.shade600,
                                  onPressed: () => isFormValid(),
                                );
                              }
                            },
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
                            onState: (context, state) {
                              return ElevatedButtonComponent(
                                label: 'CADASTRAR',
                                onPressed: () => isFormValid(),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text('ou'),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  const MaterialStatePropertyAll(Colors.white),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  side: const BorderSide(
                                    color: Color.fromRGBO(51, 78, 97, 1),
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text(
                              'Cancelar',
                              style: TextStyle(
                                color: Color.fromRGBO(51, 78, 97, 1),
                              ),
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
                          style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(14, 27, 43, 1)),
                          children: [
                            TextSpan(
                              text: ' Entrar',
                              style: const TextStyle(
                                color: Color.fromRGBO(131, 129, 88, 1),
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed('/');
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  isFormValid() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
      getIt<RegisterController>().register(
        nameController.text,
        cpfController.text,
        emailController.text,
        passwordController.text,
      );
    }
  }
}
