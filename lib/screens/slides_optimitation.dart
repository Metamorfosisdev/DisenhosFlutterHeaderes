import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:disehos_one/widgets/slider_widget.dart';

class SlidesOptimitationScreen extends StatelessWidget {
  static String routeName = '/SlidesOptimitationScreen';

  const SlidesOptimitationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderWidget(
        // selectDot: Colors.green,
        // backgroundDot: Colors.black,
        widgets: [
          SvgPicture.asset('assets/svg/slide_1.svg'),
          SvgPicture.asset('assets/svg/slide_2.svg'),
          SvgPicture.asset('assets/svg/slide_3.svg'),
          SvgPicture.asset('assets/svg/slide_4.svg'),
        ],
      ),
    );
  }
}
