import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppController extends GetxController {
  var themeMode = ThemeMode.system.obs;
  var locale = Locale('en', 'US');

  void switchTheme() {
    themeMode.value =
        themeMode.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    update();
  }

  void switchLanguage(String langCode) {
    final box = GetStorage();
    box.write('language', locale.languageCode);
    Get.updateLocale(locale);
  }
}
