import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../shell/main_shell.dart';
import '../orders/order_history_screen.dart';
import 'package:provider/provider.dart';
import '../../state/cart_provider.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  Widget buildCategoryCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String imagePath,
    required String categoryName,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () => context.push('/category/$categoryName'),
        child: Container(
          height: 230,
          margin: const EdgeInsets.all(6),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF6F6),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0x22000000),
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE9A6A6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Bestseller⭐',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE9A6A6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Sale🔥',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Center(
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.image_not_supported, size: 60);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 2),
              const Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  SizedBox(width: 4),
                  Text(
                    '4.9 (2500)',
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

@override
Widget build(BuildContext context) {
  final cart = context.watch<CartProvider>();
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'GlowUp',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFFE97F7F),
                ),
              ),
              const SizedBox(height: 8),
              Row(
  children: [
    InkWell(
      onTap: () {
        MainShell.goToTab(0);
      },
      child: const Icon(Icons.arrow_back_ios_new, size: 28),
    ),
    const SizedBox(width: 8),
    const Text(
      'Shop',
      style: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w800,
      ),
    ),
    const Spacer(),

    IconButton(
      icon: const Icon(Icons.receipt_long),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const OrderHistoryScreen(),
          ),
        );
      },
    ),

    GestureDetector(
  onTap: () {
    MainShell.goToTab(2);
  },
  child: Stack(
    children: [
      Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: const Icon(Icons.shopping_bag_outlined),
      ),

      if (cart.items.isNotEmpty)
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            constraints: const BoxConstraints(
              minWidth: 18,
              minHeight: 18,
            ),
            child: Text(
              '${cart.items.length}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
    ],
  ),
)
  ],
),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          buildCategoryCard(
                            context: context,
                            title: 'Cleanser',
                            subtitle: 'Clean Beauty',
                            imagePath: 'assets/images/cleanser_category.png',
                            categoryName: 'Cleanser',
                          ),
                          buildCategoryCard(
                            context: context,
                            title: 'Moisturizer',
                            subtitle: 'Pure Bliss',
                            imagePath: 'assets/images/moisturizer_category.png',
                            categoryName: 'Moisturizer',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          buildCategoryCard(
                            context: context,
                            title: 'Serum',
                            subtitle: 'Youth Lab',
                            imagePath: 'assets/images/serum_category.png',
                            categoryName: 'Serum',
                          ),
                          buildCategoryCard(
                            context: context,
                            title: 'Sunscreen',
                            subtitle: 'Sun Shield',
                            imagePath: 'assets/images/sunscreen_category.png',
                            categoryName: 'Sunscreen',
                          ),
                        ],
                      ),
                    ],
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