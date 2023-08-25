import 'package:flutter/material.dart';
import 'package:sb_myreports/core/widgets/custom/custom_app_bar.dart';
import 'package:sb_myreports/core/widgets/custom/loading_widget.dart';
import 'package:sb_myreports/core/widgets/decorated_container.dart';
import 'package:sb_myreports/features/dashboard/presentation/manager/ticket_provider.dart';

import '../../../../core/utils/globals/globals.dart';
import '../../../../core/widgets/custom/details_widget_row.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  late MediaQueryData screenData;

  final TicketProvider ticketProvider = sl();

  @override
  void initState() {
    ticketProvider.getUserHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenData = MediaQuery.of(context);
    return ValueListenableBuilder<bool>(
      valueListenable: ticketProvider.getUserHistoryLoading,
      builder: (context, value, child) => DecoratedContainer(
        isChildrenScrollable: false,
        appBar: CustomAppBar(title: "History", shouldUseWhiteColor: true),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: WhiteBackgroundContainer(
            child: SingleChildScrollView(
              child: value
                  ? const SizedBox(
                      height: 200,
                      child: Center(
                        child: LoadingWidget(),
                      ),
                    )
                  : ticketProvider.getUserHistoryResponseModel == null
                      ? const SizedBox(
                          height: 200,
                          child: Center(
                            child: Text("No History Found"),
                          ),
                        )
                      : SizedBox(
                          height: screenData.size.height - 210,
                          child: Column(
                            children: [
                              DetailswidgetRow(
                                title: "Date",
                                value: "Amount",
                                color: Theme.of(context).primaryColor,
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: ticketProvider
                                      .getUserHistoryResponseModel!
                                      .userTransactions!
                                      .length,
                                  itemBuilder: (context, index) =>
                                      DetailswidgetRow(
                                    title: ticketProvider
                                        .getUserHistoryResponseModel!
                                        .userTransactions![index]
                                        .createdAt!
                                        .substring(0, 10),
                                    value: "Rs " +
                                        ticketProvider
                                            .getUserHistoryResponseModel!
                                            .userTransactions![index]
                                            .balance
                                            .toString(),
                                    color: Colors.black38,
                                  ),
                                ),
                              )
                              // const SizedBox(height: 15),
                              // SizedBox(
                              //   width: 150,
                              //   child: ContinueButton(
                              //     text: "Ok",
                              //     onPressed: () {},
                              //   ),
                              // ),
                            ],
                          ),
                        ),
            ),
          ),
        ),
      ),
    );
  }
}
