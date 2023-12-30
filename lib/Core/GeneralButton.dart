// ignore_for_file: prefer_const_constructors

import 'package:bund_test/Core/Size_Config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GeneralButtons extends StatelessWidget {
  const GeneralButtons({super.key, required this.text, this.ontap});
  final String? text;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 60,
        width: SizeConfig.screenwidth,
        decoration: BoxDecoration(
          color: Colors.blue[900],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text!,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
