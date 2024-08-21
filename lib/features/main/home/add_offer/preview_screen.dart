// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:king/app/global_navigator/global_navigator.dart';
import 'package:king/core/constants/app_icons.dart';
import 'package:king/core/extensions/expanded_ext_on_widget.dart';
import 'package:king/core/extensions/hidekeyboard_ext_on_context.dart';
import 'package:king/core/extensions/padding_extension_on_widget.dart';
import 'package:king/core/ui_components/app_button.dart';
import 'package:king/data/helpers/hive_helper.dart';

import 'package:king/data/models/offer_model.dart';
import 'package:king/features/main/main_screen.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({
    Key? key,
    required this.offer,
  }) : super(key: key);
  final OfferModel offer;
  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  String comment = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.hideKeyboard();
      },
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.16),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Image.asset(
                          AppIcons.back,
                          width: 16,
                        ),
                      ),
                    ).paddingOnly(right: 20),
                    const Text(
                      "New Offer",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ).paddingOnly(bottom: 10),
                ListView(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xff333333),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _item(
                            title: "Type:",
                            value: widget.offer.transportType.name,
                          ),
                          _divider().paddingSymetric(vertical: 16),
                          _item(
                            title: "Rental Cost:",
                            value: "\$${widget.offer.cost}",
                          ),
                          _divider().paddingSymetric(vertical: 16),
                          _item(
                            title: "Payment Type:",
                            value: widget.offer.paymentMode,
                          ),
                          _divider().paddingSymetric(vertical: 16),
                          _item(
                            title: "Who rent:",
                            value: widget.offer.whoRent,
                          ),
                        ],
                      ),
                    ).paddingOnly(bottom: 24),
                    const Text(
                      "Comment:",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ).paddingOnly(bottom: 8),
                    TextField(
                      onChanged: (val) {
                        comment = val.trim();
                      },
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      maxLines: 4,
                      minLines: 4,
                      decoration: InputDecoration(
                        hintText: "Enter Here",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(.48),
                        ),
                        contentPadding: const EdgeInsets.all(16),
                        filled: true,
                        fillColor: Colors.white.withOpacity(.16),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    AppButton(
                      text: "Add New Offer",
                      onTap: () {
                        HiveHelper.addOffer(
                                widget.offer.copyWith(comment: comment))
                            .then((value) {
                          GlobalNavigator.pushAndRemoveUntil(
                            context,
                            page: const MainScreen(),
                          );
                        });
                      },
                    ).paddingSymetric(vertical: 30),
                  ],
                ).expanded(),
              ],
            ).paddingSymetric(horizontal: 20, vertical: 10),
          ),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      width: double.maxFinite,
      height: 1,
      color: Colors.white10,
    );
  }

  Widget _item({
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xffFFA20D),
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
