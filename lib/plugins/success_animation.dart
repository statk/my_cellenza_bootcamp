import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

mixin SuccessAnimation {
  OverlayEntry? _successOverlay;
  AnimationController? _successAnimationController;

  void initSuccessAnimation(TickerProviderStateMixin state) {
    _successAnimationController = AnimationController(
      vsync: state,
      duration: const Duration(milliseconds: 1700),
    );
    _successAnimationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _successAnimationController!.reset();
        _successOverlay?.remove();
      }
    });

    _successOverlay = OverlayEntry(
        builder: (context) => Lottie.asset(
              './lib/assets/congratulations-animation.json',
              controller: _successAnimationController,
              onLoaded: (_) => _successAnimationController?.forward(),
            ));
  }

  void showSuccessAnimation(BuildContext context) {
    _successOverlay = OverlayEntry(
        builder: (context) => Lottie.asset(
              './lib/assets/congratulations-animation.json',
              controller: _successAnimationController,
              onLoaded: (_) => _successAnimationController?.forward(),
            ));
    Overlay.of(context)?.insert(_successOverlay!);

    _successAnimationController?.forward();
  }
}
