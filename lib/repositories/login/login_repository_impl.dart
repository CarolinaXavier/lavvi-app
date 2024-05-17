import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavvi_app/core/rest_client/custom_dio.dart';
import 'package:lavvi_app/core/storage/storage.dart';
import 'package:lavvi_app/pages/home_page.dart';
import 'package:lavvi_app/repositories/login/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final CustomDio _dio;
  LoginRepositoryImpl(this._dio) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await Storage.getToken();
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        options.headers['Content-Type'] = 'application/json';
        return handler.next(options);
      },
    ));
  }

  @override
  Future login(String email, String password,  BuildContext context) async {
    print('Passou por aqui $email $password');
    try {
      print('Entrou no TRY');
      final result = await _dio.post('user/login', data: {
        "email": email,
        "password": password,
      });
      print('LOGIN: ${result.data}');
      await _saveToken(result.data);
     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage(),), (route) => false);
    } on DioException catch (e) {
      print('LOGIN ERROR: $e');
      if (e.response?.statusCode == 401) {
        Storage.clear();
      }
      throw UnimplementedError(e.response?.statusCode.toString());
    }
  }

  @override
  Future register(
      String name, String cpf, String email, String password) async {
    print('REGISTER: $name $cpf $email $password');
    try {
      await _dio.post(
        'user/register',
        data: {
          "name": name,
          "cpf": cpf,
          "email": email,
          "password": password,
        },
      ).then((value) {
        print('REGISTER USER: ${value.data}');
        return value;
      });
    } on DioException catch (e) {
      print('Error Repository: ${e.message}');
      throw UnimplementedError(e.response?.statusCode.toString());
    }
  }

  Future<void> _saveToken(Map data) async {
    final token = data['data']['access_token'];
    await Storage.setToken(token);
  }
}
