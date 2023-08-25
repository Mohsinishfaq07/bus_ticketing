import 'package:flutter/material.dart';
import 'package:sb_myreports/core/widgets/decorated_container.dart';
import 'package:sb_myreports/features/dashboard/presentation/manager/dashboard_provider.dart';
import 'package:sb_myreports/features/dashboard/presentation/pages/qr_page.dart';

import '../../../../core/utils/globals/globals.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DashboardProvider dashboardProvider = sl();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      primary: true,
      // bottomNavigationBar: ValueListenableBuilder<int>(
      //     valueListenable: dashboardProvider.activeIndex,
      //     builder: (context, value, child) => CustomBottomNavbar(
      //         index: value,
      //         onTap: (newIndex) {
      //           dashboardProvider.changePage(newIndex);
      //         })),
      // floatingActionButton: KeyboardVisibilityBuilder(
      //   builder: (p0, isKeyboardVisible) => AnimatedOpacity(
      //     duration: const Duration(milliseconds: 600),
      //     opacity: isKeyboardVisible ? 0 : 1,
      //     child: AnimatedContainer(
      //       duration: Duration(milliseconds: isKeyboardVisible ? 0 : 400),
      //       transform:
      //           Matrix4.translationValues(0, isKeyboardVisible ? 100 : 0, 0),
      //       child: FloatingActionButton(
      //         backgroundColor: Theme.of(context).primaryColorDark,
      //         child: const Icon(
      //           Icons.add,
      //           color: Colors.white,
      //         ),
      //         onPressed: () {
      //           dashboardProvider.changePage(2);
      //         },
      //       ),
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ValueListenableBuilder<int>(
        valueListenable: dashboardProvider.activeIndex,
        builder: (context, value, child) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          layoutBuilder: (currentChild, previousChildren) =>
              const DashboardQrPage(),
          child: DecoratedContainer(
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: WhiteBackgroundContainer(
                  padding: EdgeInsets.all(20),
                  child: SizedBox(
                    height: 200,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
