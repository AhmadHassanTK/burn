// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bund_test/Core/GeneralButton.dart';
import 'package:bund_test/Provider/DataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class FixedIncomeBody extends StatefulWidget {
  const FixedIncomeBody({super.key});

  @override
  State<FixedIncomeBody> createState() => _FixedIncomeBodyState();
}

class _FixedIncomeBodyState extends State<FixedIncomeBody> {
  bool years3term = false;
  bool years5term = false;

  Color years3termbordercolor = Colors.black12;

  Color years5termbordercolor = Colors.black12;

  Color years3termtextcolor = Colors.black54;

  Color years5termtextcolor = Colors.black54;

  Color years3termbackcolor = Colors.white;
  Color years5termbackcolor = Colors.white;

  int term = 0;
  DataProvider dataProvider = DataProvider();
  final f = NumberFormat("##,###", "en_US");
  @override
  void initState() {
    termdata();

    super.initState();
  }

  void termdata() async {
    term = await dataProvider.getTerm();
    if (term == 3) {
      setState(() {
        years3termbordercolor = Colors.black;
        years3termtextcolor = Colors.black;
        years5termbordercolor = Colors.black12;
        years5termtextcolor = Colors.black54;
        years3termbackcolor = Colors.blueGrey[100]!;
        years5termbackcolor = Colors.white;
      });
    } else if (term == 5) {
      setState(() {
        years3termbordercolor = Colors.black12;
        years3termtextcolor = Colors.black54;
        years5termbordercolor = Colors.black;
        years5termtextcolor = Colors.black;
        years5termbackcolor = Colors.blueGrey[100]!;
        years3termbackcolor = Colors.white;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      interactive: true,
      radius: Radius.circular(200),
      thickness: 8,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 16, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fixed Income Portfolio',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'A fixed income protfolio consists of bonds and other securities providing steady income and relatively lower risk',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Annual Yield To Maturity (YTM)',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    SizedBox(width: 1),
                    Icon(
                      Icons.info,
                      size: 17,
                      color: Colors.black54,
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Text('6.81%',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 31,
                      ),
                    )),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Average Rating',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      SizedBox(height: 1),
                      Text(
                        'AA',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Bonds',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      SizedBox(height: 1),
                      Text(
                        '20 Companies',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Term Types',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  SizedBox(height: 7),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 25,
                        width: 105,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.black12)),
                        child: Text(
                          '3 Year Term',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 9),
                      Container(
                        alignment: Alignment.center,
                        height: 25,
                        width: 105,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.black12)),
                        child: Text(
                          '5 Year Term',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Investment Calculator',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 335,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Investment Account',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (term != 0) {
                                HapticFeedback.vibrate();
                                dataProvider.Sub();
                              }
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey),
                                ],
                              ),
                              child: Icon(Icons.remove),
                            ),
                          ),
                          Consumer<DataProvider>(
                              builder: (context, value, child) {
                            return FutureBuilder(
                                future: value.getAmount(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      '\$${f.format(snapshot.data)}',
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 36,
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Text('0');
                                  }
                                });
                          }),
                          GestureDetector(
                            onTap: () async {
                              if (term != 0) {
                                HapticFeedback.vibrate();
                                dataProvider.Add();
                              }
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey),
                                ],
                              ),
                              child: Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        height: 22,
                        width: 76,
                        decoration: BoxDecoration(
                            //color: Colors.green[100],
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(color: Colors.lightGreen.shade100)
                            ]),
                        child: Text(
                          '6.81% YTM',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Colors.lightGreen[800],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              dataProvider.updateTerm(term: 3);
                              setState(() {
                                years3termbordercolor = Colors.black;
                                years3termtextcolor = Colors.black;
                                years5termbordercolor = Colors.black12;
                                years5termtextcolor = Colors.black54;
                                years3termbackcolor = Colors.blueGrey[100]!;
                                years5termbackcolor = Colors.white;
                                //term = 3;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 25,
                              width: 105,
                              decoration: BoxDecoration(
                                color: years3termbackcolor,
                                borderRadius: BorderRadius.circular(4),
                                border:
                                    Border.all(color: years3termbordercolor),
                              ),
                              child: Text(
                                '3 Year Term',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    color: years3termtextcolor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 9),
                          GestureDetector(
                            onTap: () {
                              dataProvider.updateTerm(term: 5);
                              setState(() {
                                years3termbordercolor = Colors.black12;
                                years3termtextcolor = Colors.black54;
                                years5termbordercolor = Colors.black;
                                years5termtextcolor = Colors.black;
                                years5termbackcolor = Colors.blueGrey[100]!;
                                years3termbackcolor = Colors.white;
                                // term = 5;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 25,
                              width: 105,
                              decoration: BoxDecoration(
                                  color: years5termbackcolor,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: years5termbordercolor,
                                  )),
                              child: Text(
                                '5 Year Term',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    color: years5termtextcolor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Capital At Maturity',
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                  Consumer<DataProvider>(
                                      builder: (context, value, child) {
                                    return FutureBuilder(
                                        future: value.getCapitalMaturity(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return Text(
                                              '\$${f.format(snapshot.data)}',
                                              style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 22,
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Text('0');
                                          }
                                        });
                                  }),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Total Interest',
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                  Consumer<DataProvider>(
                                      builder: (context, value, child) {
                                    return FutureBuilder(
                                        future: value.getTotalInterest(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return Text(
                                              '\$${f.format(snapshot.data)}',
                                              style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 22,
                                                ),
                                              ),
                                            );
                                          }

                                          return Text('0');
                                        });
                                  }),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Annual Interest',
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                  Consumer<DataProvider>(
                                      builder: (context, value, child) {
                                    return FutureBuilder(
                                        future: value.getAnnualInterest(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return Text(
                                              '\$${snapshot.data!.toStringAsFixed(1)}',
                                              style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 22,
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Text('0');
                                          }
                                        });
                                  }),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Average Maturity Date',
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                  Consumer<DataProvider>(
                                      builder: (context, value, child) {
                                    return FutureBuilder(
                                        future: value.getDate(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return Text(
                                              '${snapshot.data}',
                                              style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 22,
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Text('0');
                                          }
                                        });
                                  }),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: Text(
                    'Bonds',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.only(right: 20, left: 20),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: Image.asset('assets/netflix.png'),
                      ),
                    ),
                    trailing: Text(
                      '5.37% APY',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.lightGreen[600],
                        ),
                      ),
                    ),
                    title: Text(
                      'Netflix INC',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                    subtitle: Text(
                      'BBB',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      )),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.only(right: 20, left: 20),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: Image.asset('assets/Ford-logo2.png'),
                      ),
                    ),
                    trailing: Text(
                      '7.71% APY',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.lightGreen[600],
                        ),
                      ),
                    ),
                    title: Text(
                      'Ford Motor LLC',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                    subtitle: Text(
                      'BB+',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      )),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.only(right: 20, left: 20),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: Image.asset('assets/apple-logo.png'),
                      ),
                    ),
                    trailing: Text(
                      '4.85% APY',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.lightGreen[600],
                        ),
                      ),
                    ),
                    title: Text(
                      'Apple INC',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                    subtitle: Text(
                      'AA+',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      )),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.only(right: 20, left: 20),
                  child: ListTile(
                    leading: CircleAvatar(
                      //backgroundColor: Colors.grey[200],
                      backgroundImage: AssetImage('assets/morganstanley2.png'),
                    ),
                    trailing: Text(
                      '6.27% APY',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.lightGreen[600],
                        ),
                      ),
                    ),
                    title: Text(
                      'Morgan Stanley',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                    subtitle: Text(
                      'A-',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      )),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: GeneralButtons(text: 'Create Investment Account'),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
