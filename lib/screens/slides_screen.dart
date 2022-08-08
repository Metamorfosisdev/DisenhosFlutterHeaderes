import 'package:disehos_one/providers/dots_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlidesScreen extends StatelessWidget {
  static String routeName = '/SlidesScreen';
  const SlidesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: _PageView(),
          ),
          SizedBox(
            height: (size.height) * 0.15,
            width: size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                _DotsController(indexDots: 0),
                _DotsController(indexDots: 1),
                _DotsController(indexDots: 2),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _DotsController extends StatelessWidget {
  final double indexDots;
  const _DotsController({
    Key? key,
    required this.indexDots,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DotsController dotsController = Provider.of<DotsController>(context);
    return AnimatedContainer(
      margin: const EdgeInsets.all(10),
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        color: (dotsController.currentIndex >= indexDots - 0.5 &&
                dotsController.currentIndex < indexDots + 0.5)
            ? Colors.blue
            : Colors.grey,
        shape: BoxShape.circle,
      ),
      duration: const Duration(
        milliseconds: 200,
      ),
    );
  }
}

class _PageView extends StatefulWidget {
  const _PageView({
    Key? key,
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
      print('${pageController.page}');
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
      children: [
        SvgPicture.asset('assets/svg/slide_1.svg'),
        SvgPicture.asset('assets/svg/slide_2.svg'),
        SvgPicture.asset('assets/svg/slide_3.svg'),
      ],
    );
  }
}
