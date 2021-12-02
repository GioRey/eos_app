import 'package:eos_app/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _con = LoginController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  bool _isHiddenPassword = true;
  bool _isSelected = false;
  String _user = '';
  String _password = '';

  void _toogleVisibility() {
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [_fondoLogin(), _loginForm(context)],
      ),
    );
  }

  Widget _fondoLogin() {
    return SingleChildScrollView(
      child: Column(
        children: [
          ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                decoration:
                    const BoxDecoration(color: Color.fromRGBO(234, 0, 41, 1)),
                height: MediaQuery.of(context).size.height * 0.70,
              )),
        ],
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
              child: Container(
            height: 70,
          )),
          Container(
            width: size.width * 0.80,
            // margin: const EdgeInsets.symmetric(vertical: 5.0),
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(26),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5)
                ]),
            child: Column(
              children: [
                // const SizedBox(height: 10),
                _logo(),
                // const SizedBox(height: 5),
                _textWelcome(),
                const SizedBox(height: 5),
                _textContinue(),
                const SizedBox(height: 30),
                _textFieldEmail(),
                const SizedBox(height: 25),
                _textFieldPassword('Password'),
                const SizedBox(height: 5),
                _checkRemember(),
                const SizedBox(height: 20),
                _btnLogin()
              ],
            ),
          ),
          const SizedBox(height: 50),
          _forgetPassword()
        ],
      ),
    );
  }

  Widget _logo() {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: ),
      child: Image.asset('assets/logo_login.png', width: 200, height: 150),
    );
  }

  Widget _textWelcome() {
    return Container(
      padding: const EdgeInsets.only(right: 180),
      child: const Text(
        'Bienvenido',
        style: TextStyle(fontSize: 17),
      ),
    );
  }

  Widget _textContinue() {
    return Container(
      padding: const EdgeInsets.only(right: 50),

      // margin: const EdgeInsets.symmetric(horizontal: ),
      child: const Text(
        'Para continuar,ingrese sus credenciales.',
        style: TextStyle(fontSize: 12, color: Colors.grey),
        maxLines: 1,
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          TextField(
            controller: _con.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Usuario',
                hintStyle: const TextStyle(color: Colors.black),
                labelText: 'Usuario',
                // labelStyle: const TextStyle(color: Colors.orange),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(255, 107, 0, 1)))),
          )
        ],
      ),
    );
  }

  Widget _textFieldPassword(String hintText) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          TextField(
            controller: _con.passwordController,
            obscureText: _isHiddenPassword,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Contraseña',
                labelText: 'Contraseña',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(255, 107, 0, 1))),
                suffixIcon: hintText == "Password"
                    ? IconButton(
                        onPressed: _toogleVisibility,
                        icon: _isHiddenPassword
                            ? const Icon(Icons.visibility_off,
                                color: Colors.grey)
                            : const Icon(Icons.visibility,
                                color: Color.fromRGBO(255, 107, 0, 1)),
                      )
                    : null,
                hintStyle: const TextStyle(color: Colors.black)),
          )
        ],
      ),
    );
  }

  Widget _checkRemember() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
              activeColor: const Color.fromRGBO(255, 107, 0, 1),
              checkColor: Colors.white,
              value: _isSelected,
              onChanged: (bool value) {
                setState(() {
                  _isSelected = value;
                });
              }),
          const Text('Recordarme')
        ],
      ),
    );
  }

  Widget _btnLogin() {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: ElevatedButton.icon(
            onPressed: _con.login,
            icon: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(255, 107, 0, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.symmetric(vertical: 15)),
            label: const Text('INICIAR SESIÓN')));
  }

  Widget _forgetPassword() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: const Text(
          '¿Olvidaste la contraseña?',
          style: TextStyle(color: Colors.orange, fontSize: 16),
        ),
      ),
    );
  }
}
