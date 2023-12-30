// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bund_test/Core/GeneralButtonsforPageView.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageViewBody extends StatelessWidget {
  PageViewBody({super.key, required this.pageController});
  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        padding: EdgeInsets.only(right: 35),
                        child: Column(
                          children: [
                            Text(
                              'bünd',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF1C2C56),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Standard',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFA4ABBB),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 20),
                        child: GeneralButtonsforPageView(text: 'Start Now'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset('assets/dukascopy-seeklogo.com.png'),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    padding: EdgeInsets.only(right: 35),
                    child: Column(
                      children: [
                        Text(
                          'bünd',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1C2C56),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 42),
                    child: Text(
                      'Plus',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA4ABBB),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 20),
                    child: GeneralButtonsforPageView(text: 'Start Now'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset('assets/cim.png'),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    padding: EdgeInsets.only(right: 35),
                    child: Column(
                      children: [
                        Text(
                          'bünd',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1C2C56),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 42),
                    child: Text(
                      'Max',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA4ABBB),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 20),
                    child: GeneralButtonsforPageView(text: 'Start Now'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset('assets/ubs.png'),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    padding: EdgeInsets.only(right: 40),
                    child: Column(
                      children: [
                        Text(
                          'bünd',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1C2C56),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      'Unlimited',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA4ABBB),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 20),
                    child: GeneralButtonsforPageView(
                      text: 'Start Now',
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset('assets/ubs.png'),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
