import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen(this.switchScreen, {super.key});
  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SingleChildScrollView(
          child: Column(
            children: [
              if (width >= 600)
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/bmi-logo.png',
                        width: 300,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          Text(
                            'Welcome to your BMI Calculator!',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: 80),
                          OutlinedButton.icon(
                              onPressed: switchScreen,
                              icon: Icon(
                                Icons.arrow_right_alt_outlined,
                                size: 24,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              label: Text(
                                'Calculate your BMI',
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer),
                              )),
                        ],
                      ),
                    ],
                  ),
                )
              else
                Column(
                  children: [
                    Image.asset(
                      'assets/images/bmi-logo.png',
                    ),
                    const SizedBox(height: 70),
                    Text(
                      'Welcome to your BMI Calculator!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 80),
                    OutlinedButton.icon(
                        onPressed: switchScreen,
                        icon: Icon(
                          Icons.arrow_right_alt_outlined,
                          size: 24,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        label: Text(
                          'Calculate your BMI',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer),
                        )),
                  ],
                ),
            ],
          ),
          // ),
        ),
        ),
      );
    });
  }
}
