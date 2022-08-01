import 'package:flutter/material.dart';

class HeaderSquareWidget extends StatelessWidget {
  const HeaderSquareWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: (size.height) * .30,
      decoration: const BoxDecoration(
        color: Color(0xff95BCCC),
      ),
    );
  }
}
