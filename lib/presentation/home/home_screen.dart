import 'package:basic_layout/presentation/widgets/item_tile.dart';
import 'package:flutter/material.dart';

class HomeItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final String? badge;

  const HomeItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    this.badge,
  });
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<HomeItem> _items = [
    HomeItem(
      icon: Icons.trending_up_rounded,
      title: 'Analytics Overview',
      subtitle: 'Your stats for this week',
      color: Color(0xFF4F46E5),
      badge: 'New',
    ),
    HomeItem(
      icon: Icons.task_alt_rounded,
      title: 'Pending Tasks',
      subtitle: '4 tasks need your attention',
      color: Color(0xFF0EA47A),
    ),
    HomeItem(
      icon: Icons.notifications_none_rounded,
      title: 'Notifications',
      subtitle: '2 unread messages',
      color: Color(0xFFF59E0B),
      badge: '2',
    ),
    HomeItem(
      icon: Icons.folder_open_rounded,
      title: 'My Projects',
      subtitle: '6 active, 2 completed',
      color: Color(0xFFEC4899),
    ),
    HomeItem(
      icon: Icons.settings_outlined,
      title: 'Settings',
      subtitle: 'Account & preferences',
      color: Color(0xFF64748B),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F5FF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Top bar ──────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Good morning',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF9390B5),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'USER',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1A1833),
                            letterSpacing: -0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Avatar
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4F46E5),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Center(
                      child: Text(
                        'US',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Summary card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF4F46E5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Overall Progress',
                      style: TextStyle(
                        color: Color(0xFFB8B5F0),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '68% Complete',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 14),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: LinearProgressIndicator(
                        value: 0.68,
                        minHeight: 6,
                        backgroundColor: const Color(0xFF6E67F0),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '17 of 25 tasks done this month',
                      style: TextStyle(color: Color(0xFFB8B5F0), fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 28),

            // Section heading
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Quick access',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1833),
                  letterSpacing: -0.2,
                ),
              ),
            ),

            const SizedBox(height: 14),

            //  Items list
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 4,
                ),
                itemCount: _items.length,
                separatorBuilder: (_, _) => const SizedBox(height: 10),
                itemBuilder: (context, index) =>
                    HomeItemTile(item: _items[index]),
              ),
            ),

            //  Bottom sign out
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/login'),
                  icon: const Icon(Icons.logout_rounded, size: 18),
                  label: const Text('Sign Out'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF4F46E5),
                    side: const BorderSide(
                      color: Color(0xFFCECBF6),
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
