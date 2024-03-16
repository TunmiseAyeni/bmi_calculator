import 'package:bmi_calculator/calculator_page.dart';
import 'package:bmi_calculator/welcome_screen.dart';
import 'package:flutter/material.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 3, 33, 58));
var kDarkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 3, 33, 58),
    brightness: Brightness.dark);

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  var activeScreen = 1;
  void switchScreen() {
    setState(() {
      activeScreen = 2;
    });
  }

  void goBack() {
    setState(() {
      activeScreen = 1;
    });
  }

  // void resultScreen() {
  //   setState(() {
  //     activeScreen = 3;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Widget screen = WelcomeScreen(switchScreen);
    if (activeScreen == 2) {
      screen = CalculatorPage(goBack);
    }
    // else if (activeScreen == 3) {
    //   screen = const ResultsScreen();
    // }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: kDarkColorScheme,
          scaffoldBackgroundColor: kDarkColorScheme.background,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kDarkColorScheme.onPrimaryContainer,
            foregroundColor: kDarkColorScheme.secondaryContainer,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kDarkColorScheme.primary,
                foregroundColor: kDarkColorScheme.onSecondary),
          )),
      theme: ThemeData().copyWith(
          colorScheme: kColorScheme,
          scaffoldBackgroundColor: kColorScheme.background,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.primary,
            foregroundColor: kColorScheme.secondaryContainer,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kColorScheme.primary,
                foregroundColor: kColorScheme.onSecondary),
          )),
      home: screen,
    );
  }
}
