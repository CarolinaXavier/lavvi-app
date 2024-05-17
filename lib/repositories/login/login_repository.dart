
import 'package:flutter/material.dart';

abstract class LoginRepository {
  Future login(String email, String password, BuildContext context);
  Future register(String name, String cpf, String email, String password);
}