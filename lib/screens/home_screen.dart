import 'package:disehos_one/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:math' as Math;

class HomeScreen extends StatelessWidget {
  static String routeName = '/HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          WaveHeaderWidget(),
          Align(
            alignment: AlignmentDirectional.center,
            child: _SquareAnimated(),
          ),
        ],
      ),
    );
  }
}

class _SquareAnimated extends StatefulWidget {
  const _SquareAnimated({
    Key? key,
  }) : super(key: key);

  @override
  State<_SquareAnimated> createState() => _SquareAnimatedState();
}

class _SquareAnimatedState extends State<_SquareAnimated>
    with SingleTickerProviderStateMixin {
//AnimationController and animations

  late AnimationController animationController;
  late Animation<double> animaton;
  late Animation<double> opacity;
  late Animation<double> translateRight;
  late Animation<double> scale;

  @override
  void initState() {
    //animationController asignation
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 4000,
      ),
    );

    //Animation to rotate
    animaton = Tween(
      begin: 0.0,
      end: 2.0 * Math.pi,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOutBack,
      ),
    );

    //Animation opacity
    opacity = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.35, curve: Curves.easeIn),
      ),
    );

    //Animation translateRight
    translateRight = Tween(begin: 0.0, end: 100.0).animate(animationController);

    //Animation to Scale

    scale = Tween(begin: 0.0, end: 2.0).animate(animationController);

    //animationControllerListener
    animationController.addListener(() {
      print(animationController.status);
      if (animationController.status == AnimationStatus.completed) {
        // animationController.reverse();
        animationController.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Start at the beggining of the animation instance for being a stateful widget
    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      child: const _CubeWidgetAnimation(),
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(translateRight.value, 0),
          child: Transform.rotate(
            angle: animaton.value,
            child: Opacity(
              opacity: opacity.value,
              child: Transform.scale(
                scale: scale.value,
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CubeWidgetAnimation extends StatelessWidget {
  const _CubeWidgetAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: const BoxDecoration(
        color: Color(0xff2B4C59),
      ),
    );
  }
}
