import 'package:flutter/material.dart';

class GenButton extends StatelessWidget {
  const GenButton({super.key, required this.press, required this.label});
  final VoidCallback press;
  final String label;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: press,
        child: Text(
          label,
          style: const TextStyle(
              fontFamily: 'IranSans',
              fontSize: 17,
              fontWeight: FontWeight.w600),
        ));
  }
}
