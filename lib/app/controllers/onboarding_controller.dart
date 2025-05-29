import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  var currentPage = 0.obs;

  final onboardingData = [
    {
      "title": "organize_title",
      "desc": "organize_desc",
      "icon": Icons.view_agenda_rounded,
      "color": Color(0xFFFFD6E8),
    },
    {
      "title": "track_title",
      "desc": "track_desc",
      "icon": Icons.timeline_rounded,
      "color": Color(0xFFC8E4FF),
    },
    {
      "title": "achieve_title",
      "desc": "achieve_desc",
      "icon": Icons.emoji_events_rounded,
      "color": Color(0xFFD5F0C1),
    },
  ];

  void onPageChanged(int index) => currentPage.value = index;
}
