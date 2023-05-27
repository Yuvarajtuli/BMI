import 'package:flutter/material.dart';
import '../constants.dart';

//background box
class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {super.key, required this.colour, this.cardChild, this.onPress});
  final Color colour;
  final Widget? cardChild;
  final Function? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress?.call(),
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: const Color.fromRGBO(255, 255, 255, 0.06),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(29, 30, 51, 0.7),
              blurRadius: 16,
              spreadRadius: 1,
              offset: Offset(0, 0),
            )
          ],
        ),
        child: cardChild,
      ),
    );
  }
}

// custom icon widget
class IconWidget extends StatelessWidget {
  const IconWidget({super.key, required this.icons, this.label});
  final IconData icons;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(size: 80, icons),
        const SizedBox(height: 15),
        Text(
          label!.toUpperCase(),
          style: kLabelStyle,
        )
      ],
    );
  }
}

//round icon btn
class RoundIconBtn extends StatelessWidget {
  const RoundIconBtn({super.key, required this.icons, required this.onPressed});
  final IconData icons;
  // final Function onPressed;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(width: 55, height: 55),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(
        icons,
        color: Colors.white,
        size: 22.5,
      ),
    );
  }
}

//function btn
class FunctionBtn extends StatelessWidget {
  const FunctionBtn({super.key, required this.text, this.onClick});
  final VoidCallback? onClick;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        color: kSecCol,
        height: 70,
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
        ),
      ),
    );
  }
}
