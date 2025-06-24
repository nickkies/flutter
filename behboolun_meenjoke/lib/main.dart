import 'package:behboolun_meenjoke/home/add_product_screen.dart';
import 'package:behboolun_meenjoke/home/cart_screen.dart';
import 'package:behboolun_meenjoke/home/home_screen.dart';
import 'package:behboolun_meenjoke/home/product_detail_screen.dart';
import 'package:behboolun_meenjoke/login/login_screen.dart';
import 'package:behboolun_meenjoke/login/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'cart/:uid',
            builder: (context, state) =>
                CartScreen(state.pathParameters['uid'] ?? ''),
          ),
          GoRoute(
            path: 'product',
            builder: (context, state) => const ProductDetailScreen(),
          ),
          GoRoute(
            path: 'product/add',
            builder: (context, state) => const AddProductScreen(),
          ),
        ],
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/sign-up',
        builder: (context, state) => const SignUpScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '배부른 민족',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: router,
    );
  }
}
