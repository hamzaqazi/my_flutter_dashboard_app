import 'package:get/get.dart';
import 'package:my_flutter_dashboard_app/app/ui/pages/dashboard/dashboard_screen.dart';
import 'package:my_flutter_dashboard_app/app/ui/pages/login/login_screen.dart';

import '../ui/pages/onboarding/onboarding_screen.dart';
import '../ui/pages/splash/splash_screen.dart';

class AppRoutes {
  static const SPLASH = '/';
  static const ONBOARDING = '/onboarding';
  static const LOGIN = '/login';
  static const DASHBOARD = '/dashboard';
}

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.SPLASH, page: () => SplashScreen()),
    GetPage(name: AppRoutes.ONBOARDING, page: () => OnboardingScreen()),
    GetPage(name: AppRoutes.LOGIN, page: () => LoginScreen()),
    GetPage(name: AppRoutes.DASHBOARD, page: () => DashboardScreen()),
  ];
}
