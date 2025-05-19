import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/dados_pessoais_page.dart'; // crie essa tela depois
import 'screens/redefinir_senha_page.dart'; // crie essa depois também
import 'screens/dados_invalidos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BarbersClub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/dados': (context) => const DadosPessoaisPage(),
        '/redefinir-senha': (context) => const RedefinirSenhaScreen(),
        '/dados-invalidos': (context) => const DadosInvalidosPage(),
      },
    );
  }
}
