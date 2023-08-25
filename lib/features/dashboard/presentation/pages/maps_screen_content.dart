import 'package:flutter/material.dart';
import '../../../../core/widgets/custom/custom_app_bar.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
              leading: const SizedBox(width: 25), title: "Bus Ticket App"),
          const Text("this is maps screen"),


        ],
      ),

    );
  }
}
