import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../state/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget buildMenuButton({
    required BuildContext context,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFE97F7F), width: 2),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 110),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                'GlowUp',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFFE97F7F),
                ),
              ),
              const SizedBox(height: 36),
              buildMenuButton(
                context: context,
                title: 'My Profile',
                onTap: () => context.push('/my-profile'),
              ),
              buildMenuButton(
                context: context,
                title: 'About Glow Up',
                onTap: () => context.push('/about'),
              ),
              buildMenuButton(
                context: context,
                title: 'Notifications',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Notifications page later')),
                  );
                },
              ),
              buildMenuButton(
                context: context,
                title: 'Support',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Support page later')),
                  );
                },
              ),
              buildMenuButton(
                context: context,
                title: 'Log out',
                onTap: () {
                  context.read<AuthProvider>().logout();
                  context.go('/auth');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}