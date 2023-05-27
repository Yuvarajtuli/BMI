import 'package:flutter/material.dart';
import 'customWidgets/generalWidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'resultPage.dart';
import 'CalculationBrain.dart';

//work area
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late kGender selectedGender = kGender.other;
  int userHeight = 173;
  int userWeight = 92;
  int userAge = 21;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = kGender.male;
                      });
                    },
                    colour: selectedGender == kGender.male
                        ? kActiveCol
                        : kInactiveCol,
                    cardChild: const IconWidget(
                      icons: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = kGender.female;
                      });
                    },
                    colour: selectedGender == kGender.female
                        ? kActiveCol
                        : kInactiveCol,
                    cardChild: const IconWidget(
                      icons: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: const Color(0xFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'height'.toUpperCase(),
                    style: kLabelStyle,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        userHeight.toString(),
                        style: kNumStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelStyle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Slider(
                    value: userHeight.toDouble(),
                    onChanged: (double newVal) {
                      setState(() {
                        userHeight = newVal.round();
                      });
                    },
                    min: 100,
                    max: 280,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: const Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight'.toUpperCase(),
                          style: kLabelStyle,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              userWeight.toString(),
                              style: kNumStyle,
                            ),
                            const Text(
                              'kg',
                              style: kLabelStyle,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconBtn(
                              icons: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  userWeight < 140 ? userWeight++ : userWeight;
                                });
                              },
                            ),
                            const SizedBox(width: 20),
                            RoundIconBtn(
                              icons: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  userWeight > 30 ? userWeight-- : userWeight;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: const Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age'.toUpperCase(),
                          style: kLabelStyle,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          userAge.toString(),
                          style: kNumStyle,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconBtn(
                              icons: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  userAge < 110 ? userAge++ : userAge;
                                });
                              },
                            ),
                            const SizedBox(width: 20),
                            RoundIconBtn(
                              icons: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  userAge >= 2 ? userAge-- : userAge;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          FunctionBtn(
            text: 'calculate',
            onClick: () {
              BMICalculator calc =
                  BMICalculator(height: userHeight, weight: userWeight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calcBMI(),
                    resultBody: calc.getResultBody(),
                    resultText: calc.getResult(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
