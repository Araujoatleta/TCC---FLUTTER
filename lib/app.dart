import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'constants/theme.dart';

class BarberShopApp extends StatelessWidget {
  const BarberShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barber Shop',
      theme: AppTheme.darkTheme,
      home: const MainScreen(),
    );
  }
}