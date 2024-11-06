import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class TextFormTile extends StatelessWidget {
  String? text;
  bool isObscured = false;
  TextInputType type;
  TextEditingController controller;
  final FormFieldValidator? validator;
  final Widget? rightIcon;
  TextFormTile(
      {super.key,
      required this.isObscured,
      required this.text,
      required this.type,
      required this.controller,
      required this.validator,
      this.rightIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: type,
      obscureText: isObscured,
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: GoogleFonts.aBeeZee(color: Colors.grey, fontSize: 14),
        suffixIcon: rightIcon,
        
      ),
    );
  }
}
