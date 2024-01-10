import 'package:flutter/material.dart';
import 'package:vsu_project/layout/base_layout.dart';
import 'package:vsu_project/layout/navigation_layout.dart';
import 'package:vsu_project/screen/login_screen.dart';
import 'package:vsu_project/screen/favorite_energy_drink_screen.dart';
import 'package:vsu_project/screen/list_energy_drink_screen.dart';
import 'package:vsu_project/screen/onboarding_screen.dart';
import 'package:vsu_project/screen/register_screen.dart';
import 'package:vsu_project/utils/navigation_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Сборник энергетиков',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        NavigationUtils.login: (context) => const BaseLayout(content: LoginScreen()),
        NavigationUtils.register: (context) => const BaseLayout(content: RegisterScreen()),
        NavigationUtils.list: (context) => const NavigationLayout(targetWidget: ListEnergyDrinkScreen()),
        NavigationUtils.favorite: (context) => const NavigationLayout(targetWidget: FavoriteEnergyDrinkScreen()),
        NavigationUtils.onboarding: (context) => const BaseLayout(content: OnboardingScreen()),
      },
      initialRoute: NavigationUtils.onboarding,
    );
  }
}
