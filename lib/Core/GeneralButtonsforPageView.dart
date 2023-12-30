// ignore_for_file: prefer_const_constructors

import 'package:bund_test/Core/Size_Config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GeneralButtonsforPageView extends StatelessWidget {
  const GeneralButtonsforPageView({super.key, required this.text, this.ontap});
  final String? text;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.only(right: 10, left: 10),
        height: 40,
        width: SizeConfig.screenwidth,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Row(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset('assets/backward.png'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Image.asset('assets/forward.png',
                        color: Colors.black38),
                  ),
                ],
              ),
              SizedBox(width: 5),
              Text(
                text!,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1C2C56),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
