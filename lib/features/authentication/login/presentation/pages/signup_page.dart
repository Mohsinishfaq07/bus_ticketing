import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sb_myreports/core/router/models/page_config.dart';
import 'package:sb_myreports/core/utils/enums/page_state_enum.dart';
import 'package:sb_myreports/core/utils/validators/form_validator.dart';
import 'package:sb_myreports/core/widgets/decorated_container.dart';
import 'package:sb_myreports/features/authentication/login/presentation/manager/auth_provider.dart';

import '../../../../../core/router/app_state.dart';
import '../../../../../core/utils/globals/globals.dart';
import '../../../../../core/utils/validators/card_formator.dart';
import '../../../../../core/widgets/custom/continue_button.dart';
import '../../../../../core/widgets/custom/custom_app_bar.dart';
import '../../../../../core/widgets/custom/custom_textfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  AuthProvider authProvider = sl();

  late MediaQueryData screenData;
  bool isScrollable = false;

  // Controllers
  TextEditingController firstNameCont = TextEditingController();
  TextEditingController lastNameCont = TextEditingController();
  TextEditingController mobileCont = TextEditingController();
  TextEditingController cnicCont = TextEditingController();
  TextEditingController dobCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController cityCont = TextEditingController();
  TextEditingController addressCont = TextEditingController();
  TextEditingController universityCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  TextEditingController confirmPasswordCont = TextEditingController();
  ScrollController mainController = ScrollController();

  @override
  Widget build(BuildContext context) {
    screenData = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -300,
            left: -100,
            child: Container(
              height: 600,
              width: 600,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: const [
                      0.1,
                      0.7
                    ],
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColorDark,
                    ]),
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            top: true,
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: SizedBox(
                height: screenData.size.height,
                width: screenData.size.width,
                child: CustomScrollView(
                  // clipBehavior: Clip.none,
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      floating: true,
                      title: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: -300,
                            left: -100,
                            child: Container(
                              height: 600,
                              width: 600,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    stops: const [
                                      0.1,
                                      0.7
                                    ],
                                    colors: [
                                      Theme.of(context).primaryColor,
                                      Theme.of(context).primaryColorDark,
                                    ]),
                              ),
                            ),
                          ),
                          CustomAppBar(
                              leading: GestureDetector(
                                  onTap: () {
                                    AppState state = sl();
                                    state.goToNext(PageConfigs.loginPageConfig,
                                        pageState: PageState.replace);
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  )),
                              title: "Bus Ticket App",
                              shouldUseWhiteColor: true),
                        ],
                      ),
                    ),
                    SliverAppBar(
                      expandedHeight: screenData.size.height - 95,
                      flexibleSpace: WhiteBackgroundContainer(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 20),
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomTextField(
                                      fillColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      controller: firstNameCont,
                                      hintText: "First Name",
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTextField(
                                      fillColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      controller: lastNameCont,
                                      hintText: "Last Name",
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTextField(
                                      controller: mobileCont,
                                      validator: FormValidators.validatePhone,
                                      fillColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      hintText: "Mobile Number",
                                      keyboardType: TextInputType.number,
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTextField(
                                      controller: cnicCont,
                                      inputFormaters: [
                                        LengthLimitingTextInputFormatter(15),
                                        CardFormatter(
                                            sample: 'xxxxx-xxxxxxx-x',
                                            separator: '-')
                                      ],
                                      fillColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      keyboardType: TextInputType.number,
                                      hintText: "CNIC",
                                      onChange: (p0) {
                                        if (cnicCont.text.length == 7 ||
                                            cnicCont.text.length == 8 ||
                                            cnicCont.text.length == 15) {
                                          cnicCont.selection =
                                              TextSelection.fromPosition(
                                                  TextPosition(
                                                      offset: cnicCont
                                                          .text.length));
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTextField(
                                      keyboardType: TextInputType.number,
                                      controller: dobCont,
                                      fillColor: Theme.of(context)
                                          .scaffoldBackgroundColor,


                                      hintText: "D.O.B",),
                                    const SizedBox(height: 20),
                                    CustomTextField(
                                      controller: emailCont,
                                      fillColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      validator: FormValidators.validateEmail,
                                      hintText: "Email",
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTextField(
                                      controller: cityCont,
                                      fillColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      hintText: "City",
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTextField(
                                      controller: universityCont,
                                      fillColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      hintText: "University/College",
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTextField(
                                      controller: addressCont,
                                      fillColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      hintText: "Address",
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTextField(
                                      controller: passwordCont,
                                      fillColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      hintText: "Password",
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTextField(
                                      controller: confirmPasswordCont,
                                      fillColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      hintText: "Confirm Password",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              ContinueButton(
                                text: "Next",
                                loadingNotifier: authProvider.signupLoading,
                                onPressed: () {
                                  if (!_formKey.currentState!.validate()) {
                                  } else {
                                    authProvider.signupUser(
                                        firstNameCont.text,
                                        lastNameCont.text,
                                        mobileCont.text,
                                        cnicCont.text,
                                        dobCont.text,
                                        emailCont.text,
                                        cityCont.text,
                                        universityCont.text,
                                        addressCont.text,
                                        passwordCont.text);
                                  }
                                },
                              ),
                              const SizedBox(height: 40),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
