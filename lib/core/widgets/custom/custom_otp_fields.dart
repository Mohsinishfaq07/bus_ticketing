import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomOtpFields extends StatelessWidget {
  CustomOtpFields(
      {this.controller,
      this.errorStream,
      this.onCompleted,
      required this.onChanged,
      this.beforeTextPaste,
      this.size,
      Key? key})
      : super(key: key);

  final TextEditingController? controller;
  final StreamController<ErrorAnimationType>? errorStream;
  final Function(String)? onCompleted;
  final Function(String) onChanged;
  final bool Function(String?)? beforeTextPaste;
  double? size;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      pastedTextStyle: TextStyle(
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
      ),
      length: 5,
      obscureText: false,
      obscuringCharacter: '*',
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10.r),
        fieldHeight: 45.w,
        fieldWidth: 45.w,
        borderWidth: 1,
        activeFillColor: Colors.white,
        activeColor: Colors.grey.withOpacity(0.7),
        inactiveFillColor: Colors.white,
        inactiveColor: Theme.of(context).primaryColorDark,
        errorBorderColor: Colors.redAccent,
        selectedFillColor: Colors.white,
        selectedColor: Colors.grey.withOpacity(0.7),
      ),
      cursorColor: Colors.black,
      animationDuration: const Duration(milliseconds: 300),
      textStyle: const TextStyle(fontSize: 20, height: 1.6),
      enableActiveFill: true,
      errorAnimationController: errorStream,
      controller: controller,
      keyboardType: TextInputType.number,
      autoDisposeControllers: false,
      boxShadows: const [
        BoxShadow(
          offset: Offset(0, 2),
          color: Colors.black12,
          blurRadius: 10,
        )
      ],
      onCompleted: onCompleted,
      onChanged: onChanged,
      beforeTextPaste: beforeTextPaste,
    );
  }
}
