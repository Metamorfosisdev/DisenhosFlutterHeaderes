import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/dots_controller_provider.dart';

class SliderWidget extends StatelessWidget {
  final List<Widget> widgets;
  final bool upDots;
  final Color selectDot;
  final Color backgroundDot;
  const SliderWidget({
    Key? key,
    required this.widgets,
    this.upDots = false,
    this.selectDot = Colors.indigo,
    this.backgroundDot = Colors.grey,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          if (upDots)
            SizedBox(
              height: (size.height) * 0.15,
              width: size.width,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      widgets.length,
                      (index) => _DotsController(
                            indexDots: index,
                            selectDot: selectDot,
                            backgroundDot: backgroundDot,
                          ))),
            ),
          Expanded(
            child: _PageView(
              widgets: widgets,
            ),
          ),
          if (!upDots)
            SizedBox(
              height: (size.height) * 0.15,
              width: size.width,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      widgets.length,
                      (index) => _DotsController(
                            indexDots: index,
                            selectDot: selectDot,
                            backgroundDot: backgroundDot,
                          ))),
            ),
        ],
      ),
    );
  }
}

class _DotsController extends StatelessWidget {
  final int indexDots;
  final Color selectDot;
  final Color backgroundDot;

  const _DotsController({
    Key? key,
    required this.indexDots,
    required this.selectDot,
    required this.backgroundDot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DotsController dotsController = Provider.of<DotsController>(context);

    return AnimatedContainer(
      margin: const EdgeInsets.all(10),
      width: dotsController.primaryBullet.toDouble(),
      height: dotsController.primaryBullet.toDouble(),
      decoration: BoxDecoration(
        color: (dotsController.currentIndex >= indexDots - 0.5 &&
                dotsController.currentIndex < indexDots + 0.5)
            ? selectDot
            : backgroundDot,
        shape: BoxShape.circle,
      ),
      duration: const Duration(
        milliseconds: 200,
      ),
    );
  }
}

class _PageView extends StatefulWidget {
  final List<Widget> widgets;
  const _PageView({
    Key? key,
    required this.widgets,
  }) : super(key: key);

  @override
  State<_PageView> createState() => _PageViewState();
}

class _PageViewState extends State<_PageView> {
  late PageController pageController;
  late DotsController dotsController;
  @override
  void initState() {
    pageController = PageController();
    dotsController = Provider.of<DotsController>(context, listen: false);

    pageController.addListener(() {
      dotsController.currentIndex = pageController.page!;
    });

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const BouncingScrollPhysics(),
      children: widget.widgets,
    );
  }
}
