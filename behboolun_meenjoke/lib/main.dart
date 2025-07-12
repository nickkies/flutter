import 'package:behboolun_meenjoke/firebase_options.dart';
import 'package:behboolun_meenjoke/home/add_product_screen.dart';
import 'package:behboolun_meenjoke/home/cart_screen.dart';
import 'package:behboolun_meenjoke/home/home_screen.dart';
import 'package:behboolun_meenjoke/home/product_detail_screen.dart';
import 'package:behboolun_meenjoke/login/login_screen.dart';
import 'package:behboolun_meenjoke/login/sign_up_screen.dart';
import 'package:behboolun_meenjoke/model/product.dart';
import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<CameraDescription> cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  cameras = await availableCameras();

  if (kDebugMode) {
    try {
      await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
      FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
      FirebaseStorage.instance.useStorageEmulator('localhost', 9199);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  runApp(BehboolunMinjokeApp());
}

class BehboolunMinjokeApp extends StatelessWidget {
  BehboolunMinjokeApp({super.key});
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
            builder: (context, state) =>
                ProductDetailScreen(state.extra as Product),
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
