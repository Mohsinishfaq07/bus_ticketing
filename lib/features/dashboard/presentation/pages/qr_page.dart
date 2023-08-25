import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sb_myreports/core/router/app_state.dart';
import 'package:sb_myreports/core/router/models/page_config.dart';
import 'package:sb_myreports/core/utils/enums/page_state_enum.dart';
import 'package:sb_myreports/core/widgets/custom/custom_textfield.dart';
import 'package:sb_myreports/core/widgets/custom/loading_widget.dart';
import 'package:sb_myreports/core/widgets/decorated_container.dart';
import 'package:sb_myreports/features/dashboard/presentation/manager/user_queries_provider.dart';

import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/widgets/custom/continue_button.dart';
import '../../../../core/widgets/custom/custom_app_bar.dart';

class DashboardQrPage extends StatefulWidget {
  const DashboardQrPage({Key? key}) : super(key: key);

  @override
  State<DashboardQrPage> createState() => _DashboardQrPageState();
}

class _DashboardQrPageState extends State<DashboardQrPage> {
  ///
  late MediaQueryData screenData;
  PageController pageviewController = PageController();
  int selectedPage = 0;
  UserQueriesProvider userQueriesProvider = sl();
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController cardNumber = TextEditingController();
  TextEditingController cnicNumber = TextEditingController();

  @override
  void initState() {
    super.initState();

    pageviewController.addListener(() {
      if ((pageviewController.page!.truncate() == pageviewController.page!) &&
          pageviewController.page != selectedPage) {
        setState(() {
          selectedPage = pageviewController.page!.toInt();
        });
      }
    });

    userQueriesProvider.getUserCardDetails();
  }

  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenData = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ChangeNotifierProvider.value(
        value: userQueriesProvider,
        child: Consumer<UserQueriesProvider>(
          builder: (context, value, child) => Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: const [
                    0.2,
                    0.9
                  ],
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColorDark,
                  ]),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomAppBar(
                    title: "SCAN TO PAY",
                    leading: GestureDetector(
                      onTap: () {
                        userQueriesProvider.getUserCardDetailsResponseModel =
                            null;
                        AppState st = sl();
                        st.goToNext(PageConfigs.loginPageConfig,
                            pageState: PageState.replaceAll);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    shouldUseWhiteColor: true,
                    trailing: GestureDetector(
                      onTap: () {
                        AppState state = sl();
                        state.goToNext(PageConfigs.historyPageConfig);
                      },
                      child: const Icon(
                        Icons.history,
                        color: Colors.white,
                      ),
                    )),
                SizedBox(
                  height: screenData.size.height * 0.3,
                  child: ValueListenableBuilder<bool>(
                    valueListenable:
                        userQueriesProvider.getUserCardDetailsLoading,
                    builder: (context, value, child) => value
                        ? const Center(
                            child: LoadingWidget(),
                          )
                        : userQueriesProvider.getUserCardDetailsResponseModel ==
                                null
                            ? const Center(
                                child: Text(
                                  'Attach Card First',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : PageView(
                                controller: pageviewController,
                                children: [
                                  // SvgPicture.asset(AppAssets.qrCodeSvg),
                                  Center(
                                    child: SizedBox(
                                      height: 210,
                                      width: 210,
                                      child: WhiteBackgroundContainer(
                                        child: Column(
                                          children: [
                                            // QrImage(
                                            //   data: userQueriesProvider
                                            //       .getUserCardDetailsResponseModel!
                                            //       .card!
                                            //       .cardNumber!,
                                            //   version: QrVersions.auto,
                                            //   size: 150.0,
                                            // ),
                                            Text(
                                              userQueriesProvider
                                                  .getUserCardDetailsResponseModel!
                                                  .card!
                                                  .cardNumber!,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SvgPicture.asset(AppAssets.barCodeCodeSvg)
                                ],
                              ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      2,
                      (index) => Container(
                            height: 10,
                            width: 10,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: index == selectedPage
                                  ? Colors.white
                                  : Colors.black26,
                              shape: BoxShape.circle,
                            ),
                          )),
                ),
                const SizedBox(height: 30),
                Text(
                  userQueriesProvider.getUserCardDetailsResponseModel != null
                      ? "Align the  Code within the frame to scan and confirm to proceed to payment"
                      : "Please Link your card first in order to proceed",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ValueListenableBuilder<bool>(
                    valueListenable:
                        userQueriesProvider.getUserCardDetailsLoading,
                    builder: (context, value, child) => value
                        ? const Center(
                            child: LoadingWidget(),
                          )
                        : userQueriesProvider.getUserCardDetailsResponseModel ==
                                null
                            ? SizedBox(
                                height: 300,
                                width: screenData.size.width,
                                child: Form(
                                  key: _formKey,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomTextField(
                                            controller: cardNumber,
                                            hintText: "Card Number"),
                                        const SizedBox(height: 10),
                                        CustomTextField(
                                            controller: cnicNumber,
                                            hintText: "CNIC Number"),
                                        const Spacer(),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  screenData.size.width * 0.05),
                                          child: ContinueButton(
                                              text: "Proceed",
                                              loadingNotifier:
                                                  userQueriesProvider
                                                      .linkCardLoading,
                                              onPressed: () {
                                                if (!_formKey.currentState!
                                                    .validate()) {
                                                  return;
                                                }
                                                userQueriesProvider.linkCard(
                                                    cardNumber.text,
                                                    cnicNumber.text);
                                              },
                                              backgroundColor: Theme.of(context)
                                                  .primaryColorDark,
                                              textColor: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Column(
                                children: [
                                  Container(
                                    height: 125,
                                    padding: const EdgeInsets.all(10),
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppAssets.walletSvg,
                                              height: 20,
                                              width: 20,
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: Text(
                                                "Current Balance",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              userQueriesProvider
                                                  .getUserCardDetailsResponseModel!
                                                  .card!
                                                  .balance!
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Theme.of(context)
                                                      .primaryColorDark),
                                            ),
                                            const SizedBox(width: 10),
                                            GestureDetector(
                                              onTap: () => userQueriesProvider
                                                  .getUserCardDetails(),
                                              child: SvgPicture.asset(
                                                AppAssets.refreshSvg,
                                                height: 20,
                                                width: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            height: 10,
                                            width: 10,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColorDark,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
