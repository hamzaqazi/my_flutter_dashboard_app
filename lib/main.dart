import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/controllers/app_controller.dart';
import 'app/localization/app_translation.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final box = GetStorage();

  // Load saved preferences
  String? langCode = box.read('language') ?? 'en';
  bool isDark = box.read('isDarkMode') ?? false;

  runApp(MyApp(locale: Locale(langCode), isDark: isDark));
}

class MyApp extends StatelessWidget {
  final AppController controller = Get.put(AppController());
  final Locale locale;
  final bool isDark;
  MyApp({super.key, required this.locale, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Dashboard',
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale: locale,
      fallbackLocale: Locale('en', 'US'),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      initialRoute: AppRoutes.SPLASH,
      getPages: AppPages.pages,
    );
  }
}
