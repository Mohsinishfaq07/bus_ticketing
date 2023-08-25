import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sb_myreports/core/utils/constants/app_assets.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key, this.useSearchingLottie = false})
      : super(key: key);
  final bool useSearchingLottie;
  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      useSearchingLottie ? AppAssets.searchLottie : AppAssets.busLottie,
      height: 120,
      width: 120,
    );
  }
}
