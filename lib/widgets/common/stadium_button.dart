import 'package:flutter/material.dart';

class StadiumButton extends StatelessWidget {
  const StadiumButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFDC2E1E),
      shape: const StadiumBorder(),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: press,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24.0,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}
