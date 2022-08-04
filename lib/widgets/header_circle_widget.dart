import 'package:flutter/material.dart';

class CircularHeaderWidget extends StatelessWidget {
  const CircularHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: (size.height) * .30,
      decoration: const BoxDecoration(
        color: Color(0xff95BCCC),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
    );
  }
}
