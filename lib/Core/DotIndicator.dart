import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.dotindex});
  final int? dotindex;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 4,
      position: dotindex!,
      decorator: DotsDecorator(
        color: Colors.grey,
        activeColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
