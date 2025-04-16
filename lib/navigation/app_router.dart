import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../ui/exchange_points/exchange_points.dart';
import '../ui/home/home_screen.dart';
import '../ui/splash/splash_screen.dart';


final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/exchange_point',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: ExchangePoints(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    )
  ],
);
