import 'package:elsa_coding_challenge/routers/router_path.dart';
import 'package:elsa_coding_challenge/shared_widgets/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  void _handleGoToQuizGame(BuildContext context) {
    context.goNamed(RouterName.quizGame);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Home Screen',
      child: Column(
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
