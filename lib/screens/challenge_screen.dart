import 'package:flutter/material.dart';

class ChallengeScreen extends StatelessWidget {
  static String routeName = '/ChallengeScreen';
  const ChallengeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _AnimationSquare(),
      ),
    );
  }
}

class _AnimationSquare extends StatefulWidget {
  const _AnimationSquare({
    Key? key,
  }) : super(key: key);

  @override
  State<_AnimationSquare> createState() => _AnimationSquareState();
}

class _AnimationSquareState extends State<_AnimationSquare>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> translateRight;
  late Animation<double> translateUp;
  late Animation<double> translateLeft;
  late Animation<double> translateDown;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    );

    translateRight = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.25, curve: Curves.bounceOut),
      ),
    );
    super.initState();

    translateUp = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.25, 0.50, curve: Curves.bounceOut),
      ),
    );

    translateLeft = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.50, 0.75, curve: Curves.bounceOut),
      ),
    );

    translateDown = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.75, 1.0, curve: Curves.bounceOut),
      ),
    );

    animationController.addStatusListener((status) {
      print(translateLeft.value);
      if (animationController.isCompleted) {
        animationController.repeat();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      //child: const _Square(),
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(0, translateDown.value),
          child: Transform.translate(
            offset: Offset(-translateLeft.value, 0),
            child: Transform.translate(
              offset: Offset(0, -translateUp.value),
              child: Transform.translate(
                offset: Offset(translateRight.value, 0),
                child: const _Square(),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Square extends StatelessWidget {
  const _Square({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
    );
  }
}
