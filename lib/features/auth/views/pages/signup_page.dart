import 'package:bongo_app/shared/widgets/button.dart';
import 'package:bongo_app/shared/widgets/input_field.dart';
import 'package:bongo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _signupFormKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32.0),
          child: Center(
            child: Form(
              key: _signupFormKey,
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
                    controller: _nameController,
                    labelText: 'Name',
                    hintText: 'Weka Majina Kamili',
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Jina ni lazima';
                      }
                      return null;
                    },
                  ),
                  const Gap(20.0),
                  InputField(
                    controller: _emailController,
                    labelText: 'Email',
                    hintText: 'Weka Email',
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email ni lazima';
                      }
                      return null;
                    },
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
                      const Text('Already have an account?'),
                      TextButton(
                        onPressed: () => context.push('/signin'),
                        child: const Text('Sign In'),
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

  _generateOtp() {
    context.push('/otp-verification');
    // if (_signupFormKey.currentState!.validate()) {
    //
    // }
    // _signupFormKey.currentState!.save();
  }
}
