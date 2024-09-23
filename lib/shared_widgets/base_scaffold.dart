import 'package:elsa_coding_challenge/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({super.key, required this.child, required this.title});
  final Widget child;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        // image: DecorationImage(
        //   image: Assets.images.elseImage
        //       .provider(), // Đặt đường dẫn tới hình ảnh của bạn
        //   fit: BoxFit
        //       .contain, // Cách hình ảnh hiển thị (cover, contain, fill,...)
        // ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: child,
      ),
    );
  }
}
