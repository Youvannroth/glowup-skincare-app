import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new, size: 28),
                  ),
                  const Spacer(),
                  const Text(
                    'GlowUp',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFFE97F7F),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              const Center(
                child: Text(
                  'About Glow Up',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),

              const SizedBox(height: 22),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Text(
                  'About Us — Glow Up\n\n'
                  'Glow Up is your personal skincare partner, designed to help you understand your skin, choose the right products, and build a routine that works. We believe glowing skin should be simple, effective, and accessible to everyone.\n\n'
                  'At Glow Up, we combine smart technology with expert beauty knowledge to bring you:\n\n'
                  '✨ Personalized skincare routines\n'
                  '✨ Product recommendations based on your skin type and concerns\n'
                  '✨ Daily reminders to keep your routine on track\n'
                  '✨ Skin progress tracking with photo logs\n'
                  '✨ Tips, guides, and clean beauty education\n\n'
                  'Our mission is to empower you to confidently take care of your skin — one step at a time.',
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.6,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}