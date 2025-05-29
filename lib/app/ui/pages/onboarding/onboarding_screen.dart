import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_flutter_dashboard_app/app/routes/app_pages.dart';
import '../../../controllers/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: PageView.builder(
        controller: controller.pageController,
        itemCount: controller.onboardingData.length,
        onPageChanged: controller.onPageChanged,
        itemBuilder: (context, index) {
          final data = controller.onboardingData[index];

          return Container(
            color: data['color'] as Color,
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  data['icon'] as IconData?,
                  size: 120,
                  color: theme.colorScheme.onPrimary,
                ).animate().fadeIn(duration: 500.ms).scale(duration: 600.ms),
                const SizedBox(height: 40),
                Text(
                  (data['title'] as String).tr,
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: theme.textTheme.headlineSmall?.color,
                  ),
                  textAlign: TextAlign.center,
                ).animate().fadeIn(delay: 200.ms),
                const SizedBox(height: 20),
                Text(
                  (data['desc'] as String).tr,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: theme.textTheme.bodyMedium?.color,
                  ),
                  textAlign: TextAlign.center,
                ).animate().fadeIn(delay: 400.ms),
                const SizedBox(height: 60),
                _buildPageIndicator(theme),
                const SizedBox(height: 40),
                if (index == controller.onboardingData.length - 1)
                  ElevatedButton(
                    onPressed: () => Get.toNamed(AppRoutes.LOGIN),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      "get_started".tr,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ).animate().fadeIn(delay: 500.ms),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPageIndicator(ThemeData theme) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(controller.onboardingData.length, (i) {
          final isActive = controller.currentPage.value == i;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 6),
            height: 10,
            width: isActive ? 24 : 10,
            decoration: BoxDecoration(
              color:
                  isActive
                      ? theme.colorScheme.onSurface
                      : theme.colorScheme.onSurface.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
          );
        }),
      ),
    );
  }
}
