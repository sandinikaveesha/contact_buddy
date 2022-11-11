import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.buttonText}) : super(key: key);

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            primary: const Color.fromARGB(99, 235, 224, 224),
            onPrimary: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 15)),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
