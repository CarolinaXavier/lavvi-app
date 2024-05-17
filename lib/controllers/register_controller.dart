import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:get/get.dart';
import 'package:lavvi_app/app_injection/app_injection.dart';
import 'package:lavvi_app/pages/login_page.dart';
import 'package:lavvi_app/repositories/login/login_repository.dart';

class RegisterController extends Store<RegisterState> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  RegisterController() : super(RegisterSuccess(''));

  Future register(
      String name, String cpf, String email, String password) async {
    setLoading(true);
    try {
      final result =
          await getIt<LoginRepository>().register(name, cpf, email, password);
      update(RegisterSuccess(result));
      Future.delayed(
        const Duration(seconds: 1),
        () => Get.to(const LoginPage()),
      );
    } catch (e) {
      setError(RegisterError(e.toString()));
    } finally {
      setLoading(false);
    }
  }
}

abstract class RegisterState {}

class RegisterSuccess implements RegisterState {
  dynamic result;
  RegisterSuccess(this.result);
}

class RegisterLoading implements RegisterState {
  const RegisterLoading();
}

class RegisterError extends RegisterState {
  final String message;
  RegisterError(this.message);
}
