import 'dart:math';

import 'package:flutter/material.dart';
import 'package:king/app/global_navigator/global_navigator.dart';
import 'package:king/core/constants/app_images.dart';
import 'package:king/core/extensions/align_ext_on_widget.dart';
import 'package:king/core/extensions/expanded_ext_on_widget.dart';
import 'package:king/core/extensions/padding_extension_on_widget.dart';
import 'package:king/core/ui_components/app_button.dart';
import 'package:king/data/helpers/hive_helper.dart';
import 'package:king/features/main/main_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final slides = [
    {
      "img": AppImages.onboardingImage1,
      "title": "Welcome to\nKingBill: Share",
      "subtitle":
          "Immerse yourself in the world of cars and everything that goes with them. Find out the information you want to know directly from this app.",
    },
    {
      "img": AppImages.onboardingImage2,
      "title": "Rent of any\ntransportation",
      "subtitle":
          "In the app, you can pick up any mode of transportation that appeals to you at affordable prices.",
    },
    {
      "img": AppImages.onboardingImage3,
      "title": "Lots of\nannouncements",
      "subtitle":
          "Immerse yourself in the world of cars and everything that goes with them. Find out the information you want to know directly from this app.",
    },
  ];

  int currentSlideIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              Image.asset(
                slides[currentSlideIndex]["img"]!,
                width: double.maxFinite,
              ).paddingSymetric(horizontal: 20).align().expanded(flex: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  slides.length,
                  (index) {
                    final isActive = index == currentSlideIndex;
                    return Container(
                      width: isActive ? 20 : 6,
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: isActive
                            ? const Color(0xffFFA20D)
                            : const Color(0xff575757),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                    );
                  },
                ),
              ),
              const Spacer(),
              Text(
                slides[currentSlideIndex]["title"]!,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Text(
                slides[currentSlideIndex]["subtitle"]!,
                style: const TextStyle(
                  color: Color(0xffB9B9B9),
                ),
                textAlign: TextAlign.center,
              ).paddingSymetric(horizontal: 40),
              const Spacer(),
              AppButton(
                text: currentSlideIndex == 2 ? "Get Started" : "Next",
                onTap: () {
                  if (currentSlideIndex == 2) {
                    HiveHelper.setIsNotFirstTimeOpen();
                    GlobalNavigator.pushAndRemoveUntil(context,
                        page: const MainScreen());
                    return;
                  }
                  setState(() {
                    currentSlideIndex = min(currentSlideIndex + 1, 2);
                  });
                },
              ).paddingOnly(bottom: 10).paddingSymetric(horizontal: 20),
              if (currentSlideIndex == 2)
                const SizedBox(
                  height: 70,
                )
              else
                AppButton(
                  text: "Skip",
                  bgColor: const Color(0xff575757),
                  onTap: () {
                    HiveHelper.setIsNotFirstTimeOpen();
                    GlobalNavigator.pushAndRemoveUntil(context,
                        page: const MainScreen());
                  },
                ).paddingOnly(bottom: 15).paddingSymetric(horizontal: 20),
            ],
          ),
        ),
      ),
    );
  }
}
