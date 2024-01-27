import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/button.dart';
import '../../../../shared/widgets/input_field.dart';
import '../../../../utils/constants.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _signinFormKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
  }

  _generateOtp() {
    context.push('/otp-verification');
    // if (_signinFormKey.currentState!.validate()) {
    //   print('Validated');
    // }
    // _signinFormKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32.0),
          child: Center(
            child: Form(
              key: _signinFormKey,
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
                  InputField(
                    controller: _phoneController,
                    labelText: 'Namba ya Simu',
                    hintText: 'Weka Namba ya Simu',
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Namba ni lazima';
                      }
                      return null;
                    },
                  ),
                  const Gap(32.0),
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          label: 'Generate OTP',
                          onPressed: () => _generateOtp(),
                        ),
                      ),
                    ],
                  ),
                  const Gap(20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('New here?'),
                      TextButton(
                        onPressed: () => context.push('/signup'),
                        child: const Text('Sign Up'),
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
}
