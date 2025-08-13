// components/widgets/empty_page.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/animation/No-Data.json',
        width: 150,
        height: 150,
        repeat: true,
        animate: true,
      ),
    );
  }
}
