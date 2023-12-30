// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_declarations

import 'package:bund_test/Core/Size_Config.dart';
import 'package:bund_test/FixedIncomeView/FixedIncomeView.dart';
import 'package:bund_test/OnBoardingView/widgets/onBoardingViewBody.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  Color homecolor = Colors.black;
  Color investcolor = Colors.black54;
  Color chatcolor = Colors.black54;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: Container(
            height: 60,
            width: SizeConfig.screenwidth,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset(
                            'assets/homeF.png',
                            color: homecolor,
                          ),
                        ),
                        Text(
                          'Home',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1C2C56),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    FixedIncomeView(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              final tween = Tween(
                                      begin: Offset(1.0,
                                          0.0), //the start position on the screen
                                      end: Offset(
                                          0.0, 0.0)) // the origin of the screen
                                  .chain(CurveTween(curve: Curves.easeInOut));
                              final offsetAnimation = animation.drive(tween);

                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                            transitionDuration: Duration(milliseconds: 1000),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset(
                              'assets/invF.png',
                              color: investcolor,
                            ),
                          ),
                          Text(
                            'Investment',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF1C2C56),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset(
                            'assets/messageF.png',
                            color: chatcolor,
                          ),
                        ),
                        Text(
                          'Chat',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1C2C56),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          backgroundColor: Colors.grey.shade100,
          body: OnBoardingBody()),
    );
  }
}
