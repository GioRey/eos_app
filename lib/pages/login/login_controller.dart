// import 'package:eos_app/models/response_api.dart';
import 'package:eos_app/models/user.dart';
import 'package:eos_app/provider/users_providers.dart';
import 'package:eos_app/utils/my_snackbar.dart';
import 'package:flutter/material.dart';

class LoginController {
  BuildContext context;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  Future init(BuildContext context) async {
    this.context = context;
    await usersProvider.init(context);
  }

  void login() async {
    String username = emailController.text.trim();
    String password = passwordController.text.trim();
    if (username.isEmpty || password.isEmpty) {
      MySnackbar.show(context, 'Debe ingresar sus credenciales');

      return;
    }

    User user = await usersProvider.login(username, password);
    MySnackbar.show(context, user.cedula);
    print('Respuesta: ${user}');
  }
}
