import 'package:flutter/material.dart';
import 'package:king/app/global_navigator/global_navigator.dart';
import 'package:king/core/constants/app_images.dart';
import 'package:king/core/extensions/expanded_ext_on_widget.dart';
import 'package:king/core/extensions/padding_extension_on_widget.dart';
import 'package:king/core/ui_components/app_button.dart';
import 'package:king/data/helpers/hive_helper.dart';
import 'package:king/data/models/offer_model.dart';
import 'package:king/features/main/home/add_offer/add_offer_screen.dart';
import 'package:king/features/main/home/components/offer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<OfferModel> offers = HiveHelper.offers;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            const Text(
              "Let’s Start",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ).paddingOnly(bottom: 30),
            if (offers.isEmpty) ...[
              Image.asset(
                AppImages.empty,
                width: double.maxFinite,
              ).paddingSymetric(horizontal: 30),
              const Text(
                "There's nothing\nhere yet",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ).paddingSymetric(vertical: 35),
              const Text(
                "To add your first car or scooter, click the button below",
                style: TextStyle(
                  color: Color(0xffB9B9B9),
                ),
                textAlign: TextAlign.center,
              ).paddingSymetric(horizontal: 30),
            ] else
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 16,
                  mainAxisExtent: 210,
                ),
                shrinkWrap: true,
                primary: false,
                itemCount: offers.length,
                itemBuilder: (context, index) {
                  return OfferWidget(
                    offer: offers[index],
                  );
                },
              ),
          ],
        ).expanded(),
        AppButton(
          text: "+Add New Offer",
          onTap: () {
            GlobalNavigator.push(context, page: const AddOfferScreen());
          },
        ).paddingAll(20),
      ],
    );
  }
}
