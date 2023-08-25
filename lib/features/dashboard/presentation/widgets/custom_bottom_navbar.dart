import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({Key? key, required this.index, required this.onTap})
      : super(key: key);
  final int index;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
        icons: const [FontAwesomeIcons.ticket, FontAwesomeIcons.moneyBills],
        activeIndex: index,
        inactiveColor: Colors.white54,
        activeColor: Colors.white,
        backgroundGradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: const [
              0.0,
              1
            ],
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColorDark,
            ]),
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: onTap);
    //other params
  }
}
