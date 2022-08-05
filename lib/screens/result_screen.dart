import 'package:destini/constants.dart';

import 'package:flutter/material.dart';

import '../widgets/bottom_button.dart';
import '../widgets/my_card.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    Key? key,
    required this.bmi,
    required this.result,
    required this.interpretation,
  }) : super(key: key);
  final String bmi;
  final String result;
  final String interpretation;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  "Your Result",
                  style: kTitelTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Mycard(
                color: kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.result,
                      style: kResultTextStyle,
                    ),
                    Text(
                      widget.bmi,
                      style: kBMITextStyle,
                    ),
                    Text(
                      widget.interpretation,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
                label: "RECALCULATE",
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
