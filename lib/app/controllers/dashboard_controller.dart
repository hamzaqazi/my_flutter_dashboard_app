import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_flutter_dashboard_app/app/models/dashboard/task_model.dart';

class DashboardController extends GetxController {
  var isDarkMode = false.obs;
  final List<Map<String, dynamic>> cards = [
    {
      'title': 'my_tasks',
      'icon': Icons.task_rounded,
      'color': const Color(0xFFE1F5FE),
      'count': 4,
    },
    {
      'title': 'completed',
      'icon': Icons.check_circle_outline,
      'color': const Color(0xFFF8BBD0),
      'count': 2,
    },
    {
      'title': 'analytics',
      'icon': Icons.analytics_outlined,
      'color': const Color(0xFFDCEDC8),
      'count': 5,
    },
    {
      'title': 'settings',
      'icon': Icons.settings,
      'color': const Color(0xFFFFF9C4),
      'count': 3,
    },
  ];
  final tasks =
      <Task>[
        Task(
          title: 'Website for Rune.io',
          subtitle: 'Digital Product Design',
          progress: 0.40,
          taskCount: 12,
          color: Colors.redAccent,
        ),
        Task(
          title: 'Dashboard for ProSavvy',
          subtitle: 'Digital Product Design',
          progress: 0.75,
          taskCount: 12,
          color: Colors.teal,
        ),
        Task(
          title: 'Mobile Apps for Track.id',
          subtitle: 'Digital Product Design',
          progress: 0.50,
          taskCount: 12,
          color: Colors.amber,
        ),
        Task(
          title: 'Website for CourierGo.com',
          subtitle: 'Digital Product Design',
          progress: 0.40,
          taskCount: 12,
          color: Colors.blue,
        ),
      ].obs;

  final List<String> quotes = [
    'quote_1',
    'quote_2',
    'quote_3',
    'quote_4',
    'quote_5',
  ];

  final PageController quoteController = PageController(viewportFraction: 0.9);
  final RxInt currentQuoteIndex = 0.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void switchLanguage(Locale locale) {
    final box = GetStorage();
    box.write('language', locale.languageCode);
    Get.updateLocale(locale);
  }
}
