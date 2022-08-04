import 'package:disehos_one/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PorcentageScreen extends StatefulWidget {
  static String routeName = '/PorcentageScreen';
  const PorcentageScreen({Key? key}) : super(key: key);

  @override
  State<PorcentageScreen> createState() => _PorcentageScreenState();
}

class _PorcentageScreenState extends State<PorcentageScreen> {
  double porcentageNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  _ProgressIndicator(
                    porcentageNumber: porcentageNumber,
                    containerColor: Colors.green[100],
                    circleColor: Colors.white,
                    colorPorcentage: Colors.blue[100],
                  ),
                  _ProgressIndicator(
                    porcentageNumber: porcentageNumber,
                    containerColor: Colors.amber[100],
                    colorPorcentage: Colors.purple[100],
                  ),
                ],
              ),
              Row(
                children: [
                  _ProgressIndicator(
                    porcentageNumber: porcentageNumber,
                    containerColor: Colors.purple[100],
                    colorPorcentage: Colors.amber[100],
                  ),
                  _ProgressIndicator(
                    porcentageNumber: porcentageNumber,
                    containerColor: Colors.blue[100],
                    colorPorcentage: Colors.green[100],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          if (porcentageNumber < 100) {
            porcentageNumber += 10;
          } else {
            porcentageNumber = 0;
          }
          setState(() {});
        },
      ),
    );
  }
}

class _ProgressIndicator extends StatelessWidget {
  const _ProgressIndicator({
    Key? key,
    required this.porcentageNumber,
    this.containerColor,
    this.colorPorcentage,
    this.circleColor,
  }) : super(key: key);

  final double porcentageNumber;
  final Color? containerColor;
  final Color? colorPorcentage;
  final Color? circleColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: (size.height) * 0.5,
        width: (size.width) * 0.5,
        color: containerColor ?? Colors.blue[100],
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                '$porcentageNumber %',
                style: const TextStyle(fontSize: 30),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ProgressIndicatorWidget(
                porcentage: porcentageNumber,
                colorPorcentage: colorPorcentage ?? Colors.red[100],
                circleColor: circleColor ?? Colors.grey[100],
              ),
            )
          ],
        ),
      ),
    );
  }
}
