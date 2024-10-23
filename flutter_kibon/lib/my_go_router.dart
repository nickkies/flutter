import 'package:flutter/material.dart';
import 'package:flutter_kibon/navigate.dart';
import 'package:flutter_kibon/screen/about_page.dart';
import 'package:go_router/go_router.dart';

class MyGoRouter extends StatelessWidget {
  const MyGoRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            builder: (ctx, _) => const RouteHomeWidget(),
          ),
          GoRoute(
            path: '/home',
            name: 'new home',
            builder: (ctx, _) => const HomeWidget(),
            routes: [
              GoRoute(
                path: '/about',
                name: 'about',
                builder: (ctx, _) => const AboutPage(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RouteHomeWidget extends StatelessWidget {
  const RouteHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('go_router')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => context.pushNamed('new home'),
              child: const Text('Go to New Home'),
            ),
            TextButton(
              onPressed: () => context.pushNamed('about'),
              child: const Text('Go to About'),
            ),
            TextButton(
              onPressed: () => context.pop(),
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
