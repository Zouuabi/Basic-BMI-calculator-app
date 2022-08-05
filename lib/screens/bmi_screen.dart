import 'package:flutter/material.dart';
import '../calculator_brain.dart';
import '../widgets/bottom_button.dart';
import '../widgets/my_card.dart';
import '../widgets/rounded_button.dart';
import '../widgets/sex_card.dart';
import 'result_screen.dart';
import '../constants.dart';

enum Gender {
  zero,
  male,
  female,
}

class BMIHomepage extends StatefulWidget {
  const BMIHomepage({Key? key}) : super(key: key);

  @override
  State<BMIHomepage> createState() => _BMIHomepageState();
}

class _BMIHomepageState extends State<BMIHomepage> {
  Color femaleCardColor = kActiveCardColor;
  Color maleCardColor = kActiveCardColor;
  Gender gender = Gender.zero;
  double height = 187;
  int weight = 87;
  int age = 17;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          // *** Female and Male widgets ***
          Expanded(
            child: Row(
              children: [
                // ******** Male ***********
                Expanded(
                  child: Mycard(
                    onPress: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    color: gender == Gender.male
                        ? kInactiveCardColor
                        : kActiveCardColor,
                    child: const SexCard(icon: Icons.male, label: "MALES"),
                  ),
                ),
                // ******** Female ***********
                Expanded(
                    child: Mycard(
                  onPress: () {
                    setState(() {
                      gender = Gender.female;
                    });
                  },
                  color: gender == Gender.female
                      ? kInactiveCardColor
                      : kActiveCardColor,
                  child: const SexCard(
                    icon: Icons.female,
                    label: "FEMALE",
                  ),
                ))
              ],
            ),
          ),

          // *** Height Slider ***
          Expanded(
              child: Mycard(
            color: kActiveCardColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "HEIGHT",
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.round().toString(),
                      style: kNumberStyle,
                    ),
                    const Text(
                      "cm",
                      style: kLabelTextStyle,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Colors.teal,
                        overlayColor: const Color.fromARGB(70, 0, 150, 135),
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                        ),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 25)),
                    child: Slider(
                        inactiveColor: const Color(0xFF8D8E98),
                        value: height,
                        min: 120,
                        max: 300,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue;
                          });
                        }),
                  ),
                )
              ],
            ),
          )),

          // *** Weight and Age***

          Expanded(
            child: Row(
              children: [
                // *** WEIGHT ***
                Expanded(
                    child: Mycard(
                  color: kActiveCardColor,
                  child: HeightOrAge(
                      label: "WEIGHT",
                      value: weight,
                      onMinus: () {
                        setState(() {
                          weight--;
                        });
                      },
                      onPlus: () {
                        setState(() {
                          weight++;
                        });
                      }),
                )),
                // *** AGE***
                Expanded(
                    child: Mycard(
                  color: kActiveCardColor,
                  child: HeightOrAge(
                      label: 'AGE',
                      value: age,
                      onMinus: () {
                        setState(() {
                          age--;
                        });
                      },
                      onPlus: () {
                        setState(() {
                          age++;
                        });
                      }),
                ))
              ],
            ),
          ),

          // *** Calculate Button ***
          BottomButton(
              label: "CALCULATE",
              onPressed: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResultScreen(
                      bmi: calc.getBMI(),
                      result: calc.getResult(),
                      interpretation: calc.getInterpretation());
                }));
              }),
        ],
      )),
    );
  }
}

class HeightOrAge extends StatelessWidget {
  const HeightOrAge({
    Key? key,
    required this.label,
    required this.value,
    required this.onMinus,
    required this.onPlus,
  }) : super(key: key);

  final int value;
  final String label;
  final void Function() onMinus;
  final void Function() onPlus;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: kLabelTextStyle,
        ),
        Text(
          "$value",
          style: kNumberStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedIconButton(
              icon: Icons.arrow_back_ios_rounded,
              onPressed: onMinus,
            ),
            const SizedBox(
              width: 18,
            ),
            RoundedIconButton(
              icon: Icons.arrow_forward_ios_rounded,
              onPressed: onPlus,
            )
          ],
        )
      ],
    );
  }
}
