import 'package:flutter/material.dart';
import 'inputPage.dart';

void main() => runApp(const BMI());

// to run on every save
class BMI extends StatelessWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        sliderTheme: SliderTheme.of(context).copyWith(
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 30),
          overlayColor: const Color.fromRGBO(255, 82, 82, 0.1),
          activeTrackColor: Colors.white,
          inactiveTrackColor: const Color(0xFF8D8E98),
          thumbColor: Colors.redAccent,
        ),
        scaffoldBackgroundColor: const Color(0xff0A0E21),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff0A0E21),
        ),
      ),
      home: const InputPage(),
    );
  }
}
