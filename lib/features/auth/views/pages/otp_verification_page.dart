import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../shared/widgets/alerts.dart';
import '../../../../shared/widgets/button.dart';
import '../../../../utils/constants.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final _otpVerificationFormKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();

  //60 seconds timer
  late Timer _timer;
  int _start = 10;

  @override
  void initState() {
    super.initState();

    //starts the countdown timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _start = 0;
        });
        _timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _otpController.dispose();
    _timer.cancel();
  }

  verify() {
    context.push('/home');
    // if (_otpVerificationFormKey.currentState!.validate()) {
    //   print('Validated');
    // }
    // _otpVerificationFormKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32.0),
          child: Center(
            child: Form(
              key: _otpVerificationFormKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Hero(
                    tag: 'app_icon',
                    child: Image.asset(
                      AppConstants.appIcon,
                      height: 120,
                      width: 120,
                    ),
                  ),
                  const Gap(20.0),
                  Text(
                    'OTP Verification',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Gap(16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 210,
                        child: Text(
                          'Enter the 4-digit OTP code sent to your phone number',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 210,
                        child: PinCodeTextField(
                          length: 4,
                          obscureText: false,
                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          enableActiveFill: true,
                          cursorColor: Theme.of(context).colorScheme.primary,
                          cursorWidth: 1.0,
                          backgroundColor: Colors.transparent,
                          keyboardType: TextInputType.number,
                          controller: _otpController,
                          autoDisposeControllers: false,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(10),
                            fieldHeight: 45,
                            fieldWidth: 45,
                            activeColor:
                                Theme.of(context).colorScheme.outlineVariant,
                            activeFillColor:
                                Theme.of(context).colorScheme.surfaceVariant,
                            selectedFillColor:
                                Theme.of(context).colorScheme.surfaceVariant,
                            selectedColor:
                                Theme.of(context).colorScheme.primary,
                            inactiveColor:
                                Theme.of(context).colorScheme.outlineVariant,
                            inactiveFillColor:
                                Theme.of(context).colorScheme.surfaceVariant,
                            errorBorderColor:
                                Theme.of(context).colorScheme.primary,
                            borderWidth: 1.0,
                          ),
                          textStyle: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                              ),
                          onChanged: (value) {},
                          appContext: context,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Did not receive the code?'),
                      TextButton(
                        onPressed: () => _start == 0 ? _resendCode() : null,
                        child: Text(
                            _start == 0 ? 'Resend' : 'Resend in ${_start}s'),
                      ),
                    ],
                  ),
                  const Gap(32.0),
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          label: 'Verify',
                          onPressed: () => verify(),
                        ),
                      ),
                    ],
                  ),
                  const Gap(20.0),
                  Text(
                    'By continuing you agree to our Terms of Service and Privacy Policy',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _resendCode() {
    Alerts.show(
      context: context,
      title: 'OTP Code',
      message: 'New OTP code requested',
      type: AlertType.success,
    );
  }
}
