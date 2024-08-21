import 'dart:async';

import 'package:flutter/material.dart';
import 'package:king/core/constants/app_images.dart';
import 'package:king/core/extensions/expanded_ext_on_widget.dart';
import 'package:king/core/extensions/padding_extension_on_widget.dart';
import 'package:king/features/main/main_screen.dart';
import 'package:king/features/onboarding/onboarding_screen.dart';

import '../../app/global_navigator/global_navigator.dart';
import '../../data/helpers/hive_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;
  int progress = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        timer = Timer.periodic(const Duration(milliseconds: 20), (timer) {
          if (progress != 100) {
            setState(() {
              progress++;
            });
            return;
          }
          if (HiveHelper.isFirstTimeOpen) {
            GlobalNavigator.pushAndRemoveUntil(context,
                page: const OnboardingScreen());
          } else {
            GlobalNavigator.pushAndRemoveUntil(context,
                page: const MainScreen());
          }
          timer.cancel();
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.logo,
              width: 148,
            ).paddingOnly(bottom: 30),
            SizedBox(
              width: 120,
              height: 4,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.14),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 1,
                    top: 1,
                    right: 1,
                    bottom: 1,
                    child: Row(
                      children: [
                        if(progress > 0)
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffFFA20D),
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ).expanded(flex: progress),
                        if(progress < 100) Spacer(flex: 100 - progress,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
