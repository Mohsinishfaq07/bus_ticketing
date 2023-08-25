import 'package:flutter/material.dart';

import '../../../../core/widgets/custom/custom_app_bar.dart';

class NewHistory extends StatefulWidget {
  const NewHistory({Key? key}) : super(key: key);

  @override
  State<NewHistory> createState() => _NewHistoryState();
}

class _NewHistoryState extends State<NewHistory> {
  late MediaQueryData screenData;
  bool isOpen = false;
  String selectOption = "selectOption";
  List<String> politicsColor = <String>[
    "current day",
    "last 7 days",
    "last 10 days",
    "last 15 days",
    "last 30 days"
  ];

  @override
  Widget build(BuildContext context) {
    screenData = MediaQuery.of(context);
    var backgroundColor;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(children: [
            CustomAppBar(
                leading: const SizedBox(width: 25), title: "Bus Ticket App"),
            const Text("check Your history"),
            SizedBox(height: screenData.size.height * 0.01),
            Column(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        InkWell(
                          onTap: () {
                            isOpen = !isOpen;
                            setState(() {});
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: backgroundColor,
                              gradient: backgroundColor != null
                                  ? null
                                  : LinearGradient(stops: const [
                                      0.3,
                                      0.7
                                    ], colors: [
                                      Theme.of(context).primaryColor,
                                      Theme.of(context).primaryColorDark,
                                    ]),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(selectOption),
                                  Icon(isOpen
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down)
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (isOpen)
                          InkWell(
                            onTap: () {
                              isOpen = !isOpen;
                              setState(() {});
                            },
                            child: ListView(
                              shrinkWrap: true,
                              children: politicsColor
                                  .map((e) => Container(
                                        decoration: BoxDecoration(
                                          // border: Border.all(),
                                          // borderRadius: BorderRadius.circular(10),
                                          color: backgroundColor,
                                          gradient: backgroundColor != null
                                              ? null
                                              : LinearGradient(stops: const [
                                                  0.3,
                                                  0.8
                                                ], colors: [
                                                  Theme.of(context)
                                                      .primaryColor,
                                                  Theme.of(context)
                                                      .primaryColorDark,
                                                ]),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onTap: () {
                                              selectOption = e;
                                              isOpen = false;
                                              setState(() {});
                                            },
                                            child: Text(e),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenData.size.height * 0.05),
            Container(
              height: 400,
              width: 320,
              child: Column(
                children: [
                  Card(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Transport company"),
                              Text("Daewoo express"),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Date"),
                              Text("5/19/2023"),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Vehicle number "),
                              Text("SGN 1234"),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Price"),
                              Text("600"),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Seat Number"),
                              Text("6"),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Route"),
                              Text("Isb - Lhr"),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Advance ticket"),
                              Text("No"),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("time"),
                              Text("03:00 PM"),
                            ],
                          ),
                        ),
                        const CustomLine(),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Amount paid"),
                              Text("Rs 600"),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
        ));
  }
}

class CustomLine extends StatelessWidget {
  const CustomLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey,
    );
  }
}