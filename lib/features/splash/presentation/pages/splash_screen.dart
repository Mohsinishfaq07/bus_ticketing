import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sb_myreports/core/utils/constants/app_assets.dart';

import '../../../../core/router/app_state.dart';
import '../../../../core/router/models/page_config.dart';
import '../../../../core/utils/enums/page_state_enum.dart';
import '../../../../core/utils/globals/globals.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const SplashScreenContent(),
    );
  }
}

class SplashScreenContent extends StatefulWidget {
  const SplashScreenContent({Key? key}) : super(key: key);

  @override
  State<SplashScreenContent> createState() => _SplashScreenContentState();
}

class _SplashScreenContentState extends State<SplashScreenContent> {
  @override
  void initState() {
    super.initState();
    // Timer(const Duration(seconds: 2), () {
    //   AppState appState = sl();
    //   appState.goToNext(PageConfigs.jokePageConfig,
    //       pageState: PageState.replace);
    // });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Future.delayed(const Duration(milliseconds: 500));
      AppState appState = sl();
      appState.goToNext(PageConfigs.loginPageConfig,
          pageState: PageState.replace);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        body: Stack(
          children: [
            // Center(
            //   child: Transform.rotate(
            //     angle: 3.14 * -0.15,
            //     child: SvgPicture.asset(
            //       AppAssets.splashBusSvg,
            //       height: 300,
            //       width: 300,
            //       color: Colors.white.withOpacity(0.5),
            //     ),
            //   ),
            // ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppAssets.busSvg,
                    height: 100,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Bus Ticket App",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
