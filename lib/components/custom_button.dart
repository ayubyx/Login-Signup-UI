import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String text;

  const CustomButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 150),
        decoration: BoxDecoration(
            boxShadow: const[
               BoxShadow(color: Colors.black12, blurRadius: 8, spreadRadius: 4)
            ],
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 0, 0, 255).withOpacity(0.7)),
        child: Text(
          text,
          style: GoogleFonts.aBeeZee(
              fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
