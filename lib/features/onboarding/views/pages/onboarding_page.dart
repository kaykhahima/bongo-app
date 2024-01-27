import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../../utils/constants.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          showDoneButton: true,
          showSkipButton: true,
          skip: const Text('Skip'),
          next: const Text('Next'),
          done: const Text('Done'),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          onDone: () {
            //navigate to signin page
            context.go('/signup');
          },
          pages: [
            PageViewModel(
              title: 'Dar Yote Mikononi Mwako',
              body:
                  'Pitia maisha ya Dar es Salaam kwa njia ya kusisimua, ukiwa na furaha na shauku kila hatua ya njia.',
              image: Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    AppConstants.onboardingImage1,
                  ),
                ),
              ),
            ),
            PageViewModel(
              title: 'Pata Rafiki, Cheza, Kula',
              body:
                  'Mimi ni rafiki yako wa kudumu katika kugundua uchangamfu wa jiji. Nitakupeleka mjini.',
              image: Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    AppConstants.onboardingImage2,
                  ),
                ),
              ),
            ),
            PageViewModel(
              title: 'Mzuka Wa Dar',
              body:
                  'Tumbukia kwenye dunia ya furaha na burudani na mzuka wa kipekee.',
              image: Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    AppConstants.onboardingImage3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
