import 'package:disehos_one/providers/dots_controller_provider.dart';
import 'package:disehos_one/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((_) => DotsController()),
          lazy: true,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Disehos',
      initialRoute: SlidesOptimitationScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        ChallengeScreen.routeName: (context) => const ChallengeScreen(),
        CircularProgressScreen.routeName: (context) =>
            const CircularProgressScreen(),
        PorcentageScreen.routeName: (context) => const PorcentageScreen(),
        SlidesScreen.routeName: (context) => const SlidesScreen(),
        SlidesOptimitationScreen.routeName: (context) =>
            const SlidesOptimitationScreen(),
      },
    );
  }
}
