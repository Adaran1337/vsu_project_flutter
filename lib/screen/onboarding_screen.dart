import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import '../utils/navigation_utils.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<StatefulWidget> createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final int currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      totalPage: 3,
      headerBackgroundColor: Theme.of(context).colorScheme.inversePrimary,
      skipTextButton: const Text('Пропустить'),
      finishButtonText: 'Зарегистрироваться',
      controllerColor: Theme.of(context).colorScheme.inversePrimary,
      onFinish: () => Navigator.pushNamed(context, NavigationUtils.register),
      trailing: const Text('Войти'),
      trailingFunction: () =>
          Navigator.pushNamed(context, NavigationUtils.login),
      background: const [
        OnboardingImage('assets/slide_1.png'),
        OnboardingImage('assets/slide_2.png'),
        OnboardingImage('assets/slide_3.png'),
      ],
      speed: 1.8,
      pageBodies: const [
        OnboardingItemWidget(
            'В этом приложении собрано большое количество энергетиков'),
        OnboardingItemWidget(
            'Вы можете добавить понравивщиеся энергетики в избранное'),
        OnboardingItemWidget(
            'Теперь вы можете войти в свой аккаунт или создать его'),
      ],
    );
  }
}

class OnboardingItemWidget extends StatelessWidget {
  final String text;

  const OnboardingItemWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 420,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingImage extends StatelessWidget {
  final String assetPath;

  const OnboardingImage(this.assetPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      fit: BoxFit.fill,
      width: MediaQuery.of(context).size.width,
    );
  }
}
