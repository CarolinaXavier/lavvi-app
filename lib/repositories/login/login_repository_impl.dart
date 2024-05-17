import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lavvi_app/core/rest_client/custom_http.dart';
import 'package:lavvi_app/core/storage/storage.dart';
import 'package:lavvi_app/pages/home_page.dart';
import 'package:lavvi_app/repositories/login/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final CustomHttp _http;
  LoginRepositoryImpl(this._http);

  @override
  Future login(String email, String password, BuildContext context) async {
    print('Passou por aqui $email $password');
    try {
      print('Entrou no TRY');

      // Configuração da requisição
      final response = await _http.post(
        'user/login',
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      // Verificação da resposta
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        print('LOGIN: $result');
        await _saveToken(result);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false,
        );
      } else if (response.statusCode == 401) {
        print('LOGIN ERROR: Unauthorized');
        Storage.clear();
        throw UnimplementedError('401');
      } else {
        print('LOGIN ERROR: ${response.statusCode}');
        throw UnimplementedError(response.statusCode.toString());
      }
    } catch (e) {
      print('LOGIN ERROR: $e');
      throw UnimplementedError(e.toString());
    }
  }

  @override
  Future register(String name, String cpf, String email, String password) async {
    try {
      final response = await _http.post(
        'user/register',
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "name": name,
          "cpf": cpf,
          "email": email,
          "password": password,
        }),
      );

 
        final result = jsonDecode(response.body);
        print('REGISTER USER: $result');
        return result;
    } catch (e) {
      print('Error Repository: $e');
      throw UnimplementedError(e.toString());
    }
  }

  Future<void> _saveToken(Map data) async {
    final token = data['data']['access_token'];
    await Storage.setToken(token);
  }
}
