import 'package:flutter/material.dart';
import 'package:sb_myreports/core/widgets/custom/custom_app_bar.dart';
import 'package:sb_myreports/core/widgets/custom/custom_otp_fields.dart';

import '../../../../../core/widgets/custom/continue_button.dart';
import '../../../../../core/widgets/decorated_container.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  late MediaQueryData screenData;

  @override
  Widget build(BuildContext context) {
    screenData = MediaQuery.of(context);

    return DecoratedContainer(
      appBar: CustomAppBar(
        title: "Verification",
        shouldUseWhiteColor: true,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: WhiteBackgroundContainer(
            child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              "Enter the OTP recieved on your mobile number",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            CustomOtpFields(onChanged: (val) {}),
            const SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  const TextSpan(text: "Please Click "),
                  TextSpan(
                      text: "Resend ",
                      style:
                          TextStyle(color: Theme.of(context).primaryColorDark)),
                  const TextSpan(
                      text: "if you don't recieve OTP wuthin 30 seconds.")
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenData.size.width * 0.05),
              child: ContinueButton(
                text: "Resend",
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 20),
          ],
        )),
      ),
    );
  }
}
