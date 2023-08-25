import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sb_myreports/core/widgets/custom/custom_app_bar.dart';
import 'package:sb_myreports/features/authentication/login/presentation/manager/auth_provider.dart';
import 'package:sb_myreports/core/router/models/page_config.dart';

import '../../../../../core/router/app_state.dart';
import '../../../../../core/utils/constants/app_assets.dart';
import '../../../../../core/utils/enums/page_state_enum.dart';
import '../../../../../core/utils/globals/globals.dart';
import '../../../../../core/widgets/custom/continue_button.dart';
import '../../../../../core/widgets/custom/custom_dropdown_field.dart';
import '../../../../../core/widgets/custom/custom_textfield.dart';
import '../../../../../core/widgets/custom/link_text.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthProvider authProvider = sl();

  final GlobalKey<FormState> _formKey = GlobalKey();

  late MediaQueryData screenData;

  // Controllers
  TextEditingController emailCont = TextEditingController();

  TextEditingController passwordCont = TextEditingController();


  @override
  Widget build(BuildContext context) {
    screenData = MediaQuery.of(context);
    var backgroundColor;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          CustomAppBar(
              leading: const SizedBox(width: 25), title: "Bus Ticket App"),
          SizedBox(height: screenData.size.height * 0.05),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: emailCont,
                        hintText: "User Name",
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: passwordCont,
                        isPasswordField: true,
                        // keyboardType: TextInputType.number,
                        hintText: "Password",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: LinkText(
                    title: "Forget password?",
                    color: Colors.red,
                    onTap: () {},
                  ),
                ),
                const SizedBox(height: 20),
                ContinueButton(
                  text: "Login",
                  loadingNotifier: authProvider.loginLoading,
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                    } else {
                      authProvider.loginUser(emailCont.text, passwordCont.text);
                    }
                  },
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () => authProvider.loginWithLocalAuth(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          // onTap: () => authProvider.loginWithLocalAuth(),
                          child: SvgPicture.asset(
                            AppAssets.fingerprintSvg,
                            height: 60,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.center,
                        child: LinkText(
                          title: " Login with fingerprint/FACE ID?",
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LinkText(
                title: "Create Account?",
              ),
              LinkText(
                title: " Sign up",
                color: Theme.of(context).primaryColor,
                onTap: () {
                  AppState state = sl();
                  state.goToNext(PageConfigs.signupPageConfig,
                      pageState: PageState.replace);
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
