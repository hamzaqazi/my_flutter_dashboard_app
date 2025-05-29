import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../routes/app_pages.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(GetNumUtils(2.5).seconds, () {
      Get.offNamed(AppRoutes.ONBOARDING);
    });

    return Scaffold(
      backgroundColor: const Color(0xFFE0BBE4), // pastel purple
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.dashboard_rounded, size: 100, color: Colors.white)
                .animate()
                .fadeIn(duration: GetNumUtils(1).seconds)
                .scale(
                  duration: GetNumUtils(1.2).seconds,
                  curve: Curves.easeOutBack,
                ),
            const SizedBox(height: 20),
            Text(
              "Fluid Dash",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ).animate().fadeIn(delay: GetNumUtils(1).seconds),
          ],
        ),
      ),
    );
  }
}
