import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/config/constants/lottie_constants.dart';

final class CustomLoading extends StatelessWidget {
  const CustomLoading({
    required this.width,
    required this.height,
    super.key,
  });
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        LottieConstants.loading,
        width: width,
        height: height,
      ),
    );
  }
}
