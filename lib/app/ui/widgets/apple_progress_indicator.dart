import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amasyaapp/app/bloc/app_bloc.dart';
import 'package:amasyaapp/core/core.dart';

class AppleProgressIndicator extends StatefulWidget {
  const AppleProgressIndicator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AppleProgressIndicatorState createState() => _AppleProgressIndicatorState();
}

class _AppleProgressIndicatorState extends State<AppleProgressIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          final double value = _animation.value;
          const double radius = 20.0; // Dairenin yarıçapı
          final double angle = value * 2 * math.pi;
          final double x = radius * math.cos(angle);
          final double y = radius * math.sin(angle);

          return BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              return Transform.translate(
                offset: Offset(x, y),
                child: Transform.scale(
                  scale: 0.2, // Resim boyutunu ayarlayın
                  child: Image.asset(
                    Images.logo,
                    color: state.themeMode == ThemeMode.dark ? Colors.white : Colors.black,
                  ),
                ),
              );
            },
          );
        },
        child: const Text("data"),
      ),
    );
  }
}
