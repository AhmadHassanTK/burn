// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bund_test/Core/DotIndicator.dart';
import 'package:bund_test/OnBoardingView/widgets/PageViewBody.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  PageController? pageController;
  bool pageisbuilt = false;
  final GlobalKey _pageViewKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  double _opacity = 1.0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          pageisbuilt = true;
        });
      }
    });

    _scrollController.addListener(() {
      setState(() {
        _opacity = (_scrollController.offset / 100).clamp(0.0, 5.0);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      interactive: true,
      radius: Radius.circular(200),
      thickness: 8,
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                ),
                Positioned(
                  right: 0,
                  left: 15,
                  top: 10,
                  child: Row(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset('assets/user.png'),
                        ),
                      ),
                      SizedBox(width: 5),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Good Morning',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              'Mehemet Taser',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 130),
                      Container(
                        height: 45,
                        width: 45,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset('assets/bell.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 75,
                  bottom: 390,
                  right: 20,
                  left: 20,
                  child: PageViewBody(
                    key: _pageViewKey,
                    pageController: pageController!,
                  ),
                ),
                Positioned(
                  bottom: 360,
                  right: 0,
                  left: 0,
                  child: DotIndicator(
                    dotindex: pageController!.hasClients &&
                            pageisbuilt &&
                            _pageViewKey.currentContext != null
                        ? pageController!.page!.round()
                        : 0,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  top: 270,
                  right: 0,
                  left: 0,
                  child: pageisbuilt && _pageViewKey.currentContext != null
                      ? getWidget()!
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget? getWidget() {
    final page = pageController?.page!.round();
    if (page == 0) {
      return Standard();
    } else if (page == 1) {
      return Plus();
    } else if (page == 2) {
      return Max();
    } else {
      return Unlimited();
    }
  }

  Widget? Standard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 23),
          child: Text(
            'Conditions',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF495678),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 23),
              height: 80,
              width: 150,
              decoration: BoxDecoration(color: Colors.white54),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset('assets/depositF.png'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'No Minimum Deposit',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0B1222),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 80,
              width: 160,
              decoration: BoxDecoration(color: Colors.white54),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset('assets/bank.png'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\$15/Month (Paid Annually)',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0B1222),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'What You Get',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF495678),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 23),
              height: 80,
              width: 100,
              decoration: BoxDecoration(color: Colors.white54),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset('assets/bank.png'),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Swiss Bank',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B1222),
                            ),
                          ),
                        ),
                        Text(
                          'Account',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B1222),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 80,
              width: 100,
              decoration: BoxDecoration(color: Colors.white54),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset('assets/mastercardF.png'),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Mastercard',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B1222),
                            ),
                          ),
                        ),
                        Text(
                          'Prepaid',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B1222),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 80,
              width: 100,
              decoration: BoxDecoration(color: Colors.white54),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset('assets/thunderF.png'),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Account Open',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B1222),
                            ),
                          ),
                        ),
                        Text(
                          'Same Day',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B1222),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: _opacity,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 23),
                height: 80,
                width: 100,
                decoration: BoxDecoration(color: Colors.white54),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: Image.asset('assets/umberllaF.png'),
                    ),
                    SizedBox(height: 5),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Protected Up To',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF0B1222),
                              ),
                            ),
                          ),
                          Text(
                            '\$100,000',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF0B1222),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 80,
                width: 100,
                decoration: BoxDecoration(color: Colors.white54),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: Image.asset(
                        'assets/leafF.png',
                        color: Colors.black12,
                      ),
                    ),
                    SizedBox(height: 5),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Investments',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black12,
                              ),
                            ),
                          ),
                          Text(
                            'Portfolios',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 80,
                width: 100,
                decoration: BoxDecoration(color: Colors.white54),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                        'assets/lockerF.png',
                        color: Colors.black12,
                      ),
                    ),
                    SizedBox(height: 3),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Deposits',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black12,
                              ),
                            ),
                          ),
                          Text(
                            'Options',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget? Plus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Conditions',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF495678),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 23),
              height: 80,
              width: 150,
              decoration: BoxDecoration(color: Colors.white54),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset('assets/depositF.png'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\$10,000 Minimum',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0B1222),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 80,
              width: 160,
              decoration: BoxDecoration(color: Colors.white54),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset('assets/bank.png'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\$30/Month (Paid Annually)',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0B1222),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'What You Get',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF495678),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 23),
              height: 80,
              width: 100,
              decoration: BoxDecoration(color: Colors.white54),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset('assets/bank.png'),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Swiss Bank',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B1222),
                            ),
                          ),
                        ),
                        Text(
                          'Account',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B1222),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 80,
              width: 100,
              decoration: BoxDecoration(color: Colors.white54),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset('assets/mastercard2F.png'),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Mastercard',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B1222),
                            ),
                          ),
                        ),
                        Text(
                          'Debit/Credit',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B1222),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 80,
              width: 100,
              decoration: BoxDecoration(color: Colors.white54),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset('assets/umberllaF.png'),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Protected Up To',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B1222),
                            ),
                          ),
                        ),
                        Text(
                          '\$100,000',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B1222),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: _opacity,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 23),
                height: 80,
                width: 100,
                decoration: BoxDecoration(color: Colors.white54),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: Image.asset(
                        'assets/leafF.png',
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Center(
                      child: Column(
                        children: [
                          Text('Investments',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF0B1222),
                                ),
                              )),
                          Text('Portfolios',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF0B1222),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 80,
                width: 100,
                decoration: BoxDecoration(color: Colors.white54),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                        'assets/lockerF.png',
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 3),
                    Center(
                      child: Column(
                        children: [
                          Text('Deposits',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF0B1222),
                                ),
                              )),
                          Text('Options',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF0B1222),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 38),
      ],
    );
  }

  Widget? Max() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Conditions',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF495678),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 23),
              height: 80,
              width: 150,
              decoration: BoxDecoration(color: Colors.white54),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset('assets/depositF.png'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\$50,000 Minimum',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0B1222),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 80,
              width: 160,
              decoration: BoxDecoration(color: Colors.white54),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset('assets/bank.png'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\$200/Month (Paid Annually)',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0B1222),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'What You Get',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF495678),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 23),
              height: 80,
              width: 100,
              decoration: BoxDecoration(color: Colors.white54),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset('assets/bank.png'),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Swiss Bank',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B1222),
                            ),
                          ),
                        ),
                        Text(
                          'Account',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B1222),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 80,
              width: 100,
              decoration: BoxDecoration(color: Colors.white54),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset('assets/mastercard2F.png'),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Mastercard',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B1222),
                            ),
                          ),
                        ),
                        Text(
                          'Debit/Credit',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B1222),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 80,
              width: 100,
              decoration: BoxDecoration(color: Colors.white54),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset('assets/umberllaF.png'),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Protected Up To',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B1222),
                            ),
                          ),
                        ),
                        Text(
                          '\$100,000',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B1222),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: _opacity,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 23),
                height: 80,
                width: 100,
                decoration: BoxDecoration(color: Colors.white54),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: Image.asset(
                        'assets/leafF.png',
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Investments',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF0B1222),
                              ),
                            ),
                          ),
                          Text(
                            'Portfolios',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF0B1222),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 80,
                width: 100,
                decoration: BoxDecoration(color: Colors.white54),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                        'assets/lockerF.png',
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 3),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Deposits',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF0B1222),
                              ),
                            ),
                          ),
                          Text(
                            'Options',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF0B1222),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }

  Widget? Unlimited() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Conditions',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF495678),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 23),
              height: 80,
              width: 150,
              decoration: BoxDecoration(color: Colors.white54),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset('assets/depositF.png'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\$500,000 Minimum',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0B1222),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 80,
              width: 150,
              decoration: BoxDecoration(color: Colors.white54),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset('assets/bank.png'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'No Monthly Subscription',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0B1222),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'What You Get',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF495678),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 23),
              height: 80,
              width: 100,
              decoration: BoxDecoration(color: Colors.white54),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset('assets/bank.png'),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Swiss Bank',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B1222),
                            ),
                          ),
                        ),
                        Text(
                          'Account',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B1222),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 80,
              width: 100,
              decoration: BoxDecoration(color: Colors.white54),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset('assets/mastercard2F.png'),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Mastercard',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B1222),
                            ),
                          ),
                        ),
                        Text(
                          'Debit/Credit',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B1222),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 80,
              width: 100,
              decoration: BoxDecoration(color: Colors.white54),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset('assets/umberllaF.png'),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Protected Up To',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B1222),
                            ),
                          ),
                        ),
                        Text(
                          '\$100,000',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B1222),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: _opacity,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 23),
                height: 80,
                width: 100,
                decoration: BoxDecoration(color: Colors.white54),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: Image.asset(
                        'assets/leafF.png',
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Investments',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF0B1222),
                              ),
                            ),
                          ),
                          Text(
                            'Portfolios',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF0B1222),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 80,
                width: 100,
                decoration: BoxDecoration(color: Colors.white54),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                        'assets/lockerF.png',
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 3),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Deposits',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF0B1222),
                              ),
                            ),
                          ),
                          Text(
                            'Options',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF0B1222),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
