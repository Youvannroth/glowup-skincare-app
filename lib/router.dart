import 'package:go_router/go_router.dart';
import 'features/landing/landing_screen.dart';
import 'features/auth/auth_choice_screen.dart';
import 'features/auth/login_screen.dart';
import 'features/auth/register_screen.dart';
import 'features/shell/main_shell.dart';
import 'features/shop/category_products_screen.dart';
import 'features/product/product_detail_screen.dart';
import 'features/checkout/checkout_screen.dart';
import 'features/profile/my_profile_screen.dart';
import 'features/profile/about_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/landing',
  routes: [
    GoRoute(
      path: '/landing',
      builder: (context, state) => const LandingScreen(),
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => const AuthChoiceScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/app',
      builder: (context, state) => MainShell(key: MainShell.shellKey),
    ),
    GoRoute(
      path: '/category/:name',
      builder: (context, state) {
        final categoryName = state.pathParameters['name'] ?? '';
        return CategoryProductsScreen(categoryName: categoryName);
      },
    ),
    GoRoute(
      path: '/product',
      builder: (context, state) {
        final product = state.extra as Map<String, String>;
        return ProductDetailScreen(product: product);
      },
    ),
    GoRoute(
      path: '/checkout',
      builder: (context, state) => const CheckoutScreen(),
    ),
    GoRoute(
      path: '/my-profile',
      builder: (context, state) => const MyProfileScreen(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutScreen(),
    ),
  ],
);