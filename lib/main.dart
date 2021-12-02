import 'package:eos_app/pages/consultas/consultas_page.dart';
import 'package:eos_app/pages/consultas/ordenes_anidadas_page.dart';
import 'package:eos_app/pages/login/login_page.dart';
import 'package:eos_app/pages/offline/offline.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EOS APP',
      debugShowCheckedModeBanner: false,
      initialRoute: 'consultas',
      routes: {
        'login': (BuildContext context) => const LoginPage(),
        'consultas': (BuildContext context) => ConsultasPage(),
        'ordenesAnidadas': (BuildContext context) => OrdenesAnidadasPage(),
        'offline': (BuildContext context) => const OfflinePage(),
      },
      theme: ThemeData(
          primaryColor: const Color.fromRGBO(234, 0, 41, 1),
          appBarTheme: const AppBarTheme(elevation: 0)),
    );
  }
}
