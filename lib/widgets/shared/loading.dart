import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat();

  late final Animation<double> _firstDotAnimation = TweenSequence<double>([
    TweenSequenceItem(
      tween: Tween(begin: 0.5, end: 1.0).chain(
        CurveTween(curve: Curves.easeInOut),
      ),
      weight: 30,
    ),
    TweenSequenceItem(
      tween: Tween(begin: 1.0, end: 0.5).chain(
        CurveTween(curve: Curves.easeInOut),
      ),
      weight: 30,
    ),
  ]).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.0,
        0.6,
        curve: Curves.easeInOut,
      ),
    ),
  );

  late final Animation<double> _secondDotAnimation = TweenSequence<double>([
    TweenSequenceItem(
      tween: Tween(begin: 0.5, end: 1.0).chain(
        CurveTween(curve: Curves.easeInOut),
      ),
      weight: 70,
    ),
    TweenSequenceItem(
      tween: Tween(begin: 1.0, end: 0.5).chain(
        CurveTween(curve: Curves.easeInOut),
      ),
      weight: 70,
    ),
  ]).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.2,
        0.8,
        curve: Curves.easeInOut,
      ),
    ),
  );

  late final Animation<double> _thirdDotAnimation = TweenSequence<double>([
    TweenSequenceItem(
      tween: Tween(begin: 0.5, end: 1.0).chain(
        CurveTween(curve: Curves.easeInOut),
      ),
      weight: 40,
    ),
    TweenSequenceItem(
      tween: Tween(begin: 1.0, end: 0.5).chain(
        CurveTween(curve: Curves.easeInOut),
      ),
      weight: 60,
    ),
  ]).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.4,
        1.0,
        curve: Curves.easeInOut,
      ),
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDot(Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Container(
          width: 16 * animation.value,
          height: 16 * animation.value,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.primary,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildDot(_firstDotAnimation),
          _buildDot(_secondDotAnimation),
          _buildDot(_thirdDotAnimation),
        ],
      ),
    );
  }
}
