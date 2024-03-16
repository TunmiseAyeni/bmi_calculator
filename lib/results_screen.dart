// This file contains the code for the results screen of the app.
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.name, this.bmi, this.bmiString, {super.key});
  final String name;
  final double bmi;
  final String bmiString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                'Note: A Healthy BMI is between 25 and 29.9.',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  'Your BMI Results...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    'Hi $name, your BMI is $bmiString',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (bmi >= 18.5 && bmi <= 24.9)
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      'You have a an under body weight. Eat more!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                if (bmi >= 25 && bmi <= 29.9)
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      'You have a a normal body weight. Good work!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                if (bmi >= 30)
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      'You have a an over body weight. Exercise more!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
