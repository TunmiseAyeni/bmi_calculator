import 'package:bmi_calculator/results_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage(this.goBack, {super.key});
  final void Function() goBack;

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final nameController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  void calculateBMI() {
    final name = nameController.text;
    final weight = double.tryParse(weightController.text);
    final weightIsInvalid = weight == null || weight <= 0;
    final height = double.tryParse(heightController.text);
    final heightIsInvalid = height == null || height <= 0;

    if (name.trim().isEmpty || weightIsInvalid || heightIsInvalid) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(
                  'Invalid Input',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
                content: Text(
                  'Please enter valid input',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Okay'))
                ],
              ));
    } else {
      final bmi = weight / (height * height);
      final bmiString = bmi.toStringAsFixed(2);
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Your BMI Results...'),
                content: Text('Hi $name, your BMI is $bmiString'),
                actions: [
                  TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ResultsScreen(name, bmi, bmiString)));
                      },
                      icon: const Icon(Icons.arrow_right_alt_outlined),
                      label: const Text('See your Results'))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final space = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'BMI Calculator',
            textAlign: TextAlign.start,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 30, 30, space + 16),
            child: Column(
              children: [
                if (width >= 600)
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: TextField(
                      controller: nameController,
                      maxLength: 40,
                      decoration: const InputDecoration(
                        label: Text('Name'),
                      ),
                    ),
                  )
                else
                  TextField(
                    controller: nameController,
                    maxLength: 40,
                    decoration: const InputDecoration(
                      label: Text('Name'),
                    ),
                  ),
                if (width >= 600)
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: weightController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              label: Text(
                                'Weight (kg) ',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: heightController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text(
                                      'Height (m\u00B2) ',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: weightController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            label: Text(
                              'Weight (kg) ',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: heightController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  label: Text(
                                    'Height (m\u00B2) ',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        widget.goBack();
                      },
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        calculateBMI();
                      },
                      child: const Text('Calculate'),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
