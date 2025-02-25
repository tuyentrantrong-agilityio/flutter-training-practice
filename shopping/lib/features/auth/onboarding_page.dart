import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/onboarding.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const OnboardingText(),
            const SizedBox(height: 30),
            const OnboardingDescription(),
            const SizedBox(height: 50),
            Center(child: GetStartedButton()),
          ],
        ),
      ),
    );
  }
}

class OnboardingText extends StatelessWidget {
  const OnboardingText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'MAKE YOUR',
          style: TextStyle(
            color: Color(0xFF5F5F5F),
            fontSize: 24,
            fontFamily: 'Gelasio',
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'HOME BEAUTIFUL',
          style: TextStyle(
            color: Color(0xFF303030),
            fontSize: 30,
            fontFamily: 'Gelasio',
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class OnboardingDescription extends StatelessWidget {
  const OnboardingDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'The best simple place where you discover most wonderful furnitures and make your home beautiful',
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: Color(0xFF808080),
        fontSize: 18,
        fontFamily: 'Nunito Sans',
        fontWeight: FontWeight.w400,
        height: 1.94,
      ),
    );
  }
}

class GetStartedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF232323),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        shadowColor: const Color(0x4C303030),
        elevation: 8,
      ),
      onPressed: () {},
      child: const Text(
        'Get Started',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'Gelasio',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
