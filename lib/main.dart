// ignore_for_file: prefer_const_constructors

import 'package:bund_test/OnBoardingView/onBoardingView.dart';
import 'package:bund_test/Provider/DataProvider.dart';
import 'package:bund_test/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataProvider>(
          create: ((context) => DataProvider()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnBoardingView(),
      ),
    );
  }
}
