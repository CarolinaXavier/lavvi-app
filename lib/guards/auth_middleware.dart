import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavvi_app/core/storage/storage.dart';

// class AuthMiddleware extends GetMiddleware {
//    String? token;

//     AuthMiddleware() {
//       getToken();
//     }

//   @override
//   RouteSettings? redirect(String? route) {

//     bool isAuthenticated = token!.isEmpty; // Isso deve ser baseado em sua lógica de autenticação
//     print('IsAuthenticated: $isAuthenticated $token');
//     if (!isAuthenticated) {
//       // Redireciona para a tela de login se não autenticado
//     return const RouteSettings(name: '/');
//     }

//     return null; // Permite o acesso se autenticado
//   }

//   getToken() async {
//     token = await Storage.getToken() ?? '';
//   }
// }

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    bool isAuthenticated = false;
    if (!isAuthenticated) {
      return const RouteSettings(name: '/login-page');
    }
  }
}
