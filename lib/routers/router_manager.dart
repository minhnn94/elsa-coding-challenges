import 'package:elsa_coding_challenge/routers/router_path.dart';
import 'package:elsa_coding_challenge/screens/home_screen/home_screen.dart';
import 'package:elsa_coding_challenge/screens/login/login_screens.dart';
import 'package:elsa_coding_challenge/screens/quiz_game_screen/quiz_game_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter routerConfig = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: RouterName.homeScreen,
          name: RouterName.homeScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: RouterName.quizGame,
          name: RouterName.quizGame,
          builder: (BuildContext context, GoRouterState state) {
            return const QuizGameScreen();
          },
        ),
      ],
    ),
  ],
);
