import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:revogarageapp/app/bloc/app_bloc.dart";
import "package:revogarageapp/core/images.dart";

class AppleProgressIndicator extends StatefulWidget {
  const AppleProgressIndicator({
    super.key,
  });

  @override
  State<AppleProgressIndicator> createState() => _AppleProgressIndicatorState();
}

class _AppleProgressIndicatorState extends State<AppleProgressIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Center(
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return RotationTransition(
            alignment: Alignment.center,
            filterQuality: FilterQuality.high,
            turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
            child: Image.asset(
              Images.logo,
              color: state.themeMode == ThemeMode.dark ? Colors.white : Colors.black,
              height: MediaQuery.of(context).size.height / 15,
            ),
          );
        },
      ),
    );
  }
}
