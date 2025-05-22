import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/service/service_details_screen.dart';
import 'screens/payment/payment_methods_screen.dart';
import 'screens/barbershop/barbershop_list_screen.dart';
import 'services/auth_service.dart';
import 'theme/app_theme.dart';

class BarberShopApp extends StatelessWidget {
  const BarberShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barber Shop',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => Consumer<AuthService>(
          builder: (context, authService, _) {
            if (authService.isLoggedIn) {
              return const HomeScreen();
            } else {
              return const LoginScreen();
            }
          },
        ),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(),
        '/payment-methods': (context) => const PaymentMethodsScreen(),
        '/barbershops': (context) => const BarbershopListScreen(),
      },
    );
  }
}