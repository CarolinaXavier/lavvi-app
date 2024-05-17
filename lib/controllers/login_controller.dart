import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:lavvi_app/app_injection/app_injection.dart';
import 'package:lavvi_app/repositories/login/login_repository.dart';

class LoginController extends Store<LoginState> {

  LoginController() : super(LoginSuccess(''));
  

  Future login(String email, String password, BuildContext context) async {
    setLoading(true);
    try {
      final result = await getIt<LoginRepository>().login(email, password, context);
      update(LoginSuccess(result));
    } catch (e) {
      print('Error controller $e');
      setError(LoginError(e.toString()));
    } finally {
      setLoading(false);
    }
  }
}

abstract class LoginState {}

class LoginSuccess implements LoginState {
  dynamic result;
  LoginSuccess(this.result);
}

class LoginLoading implements LoginState {
  const LoginLoading();
}

class LoginError extends LoginState {
  final String message;
  LoginError(this.message);
}
