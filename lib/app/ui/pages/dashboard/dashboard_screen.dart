import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_flutter_dashboard_app/app/controllers/dashboard_controller.dart';
import 'package:my_flutter_dashboard_app/app/controllers/theme_controller.dart';
import 'package:my_flutter_dashboard_app/app/models/dashboard/task_model.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final DashboardController controller = Get.put(DashboardController());
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? const Color(0xFF121212) : const Color(0xFFF6F7FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.png'),
              radius: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Hi, Dev',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Text('👋', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  Text(
                    'daily_adventure'.tr,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: isDark ? Colors.white70 : Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [_buildChangeLangButton(), _buildSwitchThemeButton()],
      ),
      body: _buildBody(isDark),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Obx _buildSwitchThemeButton() {
    return Obx(
      () => IconButton(
        icon: Icon(
          themeController.isDarkMode.value ? Icons.dark_mode : Icons.light_mode,
        ),
        onPressed: themeController.toggleTheme,
      ),
    );
  }

  PopupMenuButton<Locale> _buildChangeLangButton() {
    return PopupMenuButton<Locale>(
      icon: const Icon(Icons.language),
      onSelected: (locale) {
        controller.switchLanguage(locale);
        Get.updateLocale(locale);
      },
      itemBuilder:
          (context) => [
            const PopupMenuItem(value: Locale('en'), child: Text('English')),
            const PopupMenuItem(value: Locale('ur'), child: Text('اردو')),
            const PopupMenuItem(value: Locale('fr'), child: Text('Français')),
            const PopupMenuItem(value: Locale('es'), child: Text('Español')),
          ],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: (index) {},
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          label: 'Add Task',
        ),
      ],
    );
  }

  Widget _buildBody(bool isDark) {
    return Column(
      children: [
        const SizedBox(height: 16),
        _buildCardsGridView(isDark),
        const SizedBox(height: 20),
        _buildRecentTaskTitle(isDark),
        const SizedBox(height: 12),
        _buildRecentTasksList(),
      ],
    );
  }

  Expanded _buildRecentTasksList() {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.tasks.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final task = controller.tasks[index];
          return _buildTaskCard(task);
        },
      ),
    );
  }

  Padding _buildRecentTaskTitle(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'recent_task'.tr,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildCardsGridView(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.4, // Adjust as needed
        physics: const NeverScrollableScrollPhysics(),
        children:
            controller.cards.map((card) {
              return Container(
                decoration: BoxDecoration(
                  color: card['color'].withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(card['icon'], size: 24),
                    const SizedBox(height: 8),
                    Text(
                      (card['title'] as String).tr,
                      style: GoogleFonts.poppins(
                        color: isDark ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '${card['count']} ${'tasks'.tr}',
                      style: GoogleFonts.poppins(
                        color: isDark ? Colors.white70 : Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildTaskCard(Task task) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: task.color.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  task.subtitle,
                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.check_circle_outline, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      '${task.taskCount} ${'tasks'.tr}',
                      style: GoogleFonts.poppins(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(
                  value: task.progress,
                  strokeWidth: 5,
                  backgroundColor: Colors.grey.shade200,
                  color: task.color,
                ),
              ),
              Text(
                '${(task.progress * 100).round()}%',
                style: GoogleFonts.poppins(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
