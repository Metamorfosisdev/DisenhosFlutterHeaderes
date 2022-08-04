import 'package:disehos_one/screens/screens.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Disehos',
      initialRoute: PorcentageScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        ChallengeScreen.routeName: (context) => const ChallengeScreen(),
        CircularProgressScreen.routeName: (context) =>
            const CircularProgressScreen(),
        PorcentageScreen.routeName: (context) => const PorcentageScreen(),
      },
    );
  }
}
