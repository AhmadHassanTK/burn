// ignore_for_file: prefer_const_constructors

import 'package:bund_test/FixedIncomeView/Widgets/FixedIncomeBody.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FixedIncomeView extends StatelessWidget {
  const FixedIncomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text(
          'Fixed Income',
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: FixedIncomeBody(),
    ));
  }
}
