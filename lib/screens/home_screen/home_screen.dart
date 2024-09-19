import 'package:elsa_coding_challenge/routers/router_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  void _handleGoToQuizGame(BuildContext context) {
    context.goNamed(RouterName.quizGame);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Home Screen',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Center(
            child: InkWell(
              onTap: () => _handleGoToQuizGame(context),
              child: Container(
                  padding: const EdgeInsets.all(16),
                  color: Theme.of(context).colorScheme.inversePrimary,
                  child: const Text(
                    'Go to Quiz Game',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
