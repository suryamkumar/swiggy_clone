import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food/view/ui/splash_page.dart';
import 'package:food/view/ui/home/home.dart';
import 'package:food/view/ui/product_details/product_details.dart';

class AppRouter {
  static final GoRouter config = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        name: 'splash',
        path: '/splash',
        pageBuilder: (context, state) =>
        const MaterialPage(child: SplashPage()),
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        pageBuilder: (context, state) =>
        const MaterialPage(child: HomePage()),
      ),
      GoRoute(
        name: 'productDetails',
        path: '/productDetails',
        builder: (context, state) {
          final productId = state.extra as String;
          return ProductDetailPage(productId: productId);
        },
      ),
    ],
  );
}
