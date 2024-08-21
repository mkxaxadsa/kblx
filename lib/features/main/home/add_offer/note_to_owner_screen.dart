// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:king/app/global_navigator/global_navigator.dart';
import 'package:king/core/extensions/expanded_ext_on_widget.dart';
import 'package:king/core/extensions/hidekeyboard_ext_on_context.dart';
import 'package:king/core/extensions/padding_extension_on_widget.dart';

import 'package:king/data/models/offer_model.dart';
import 'package:king/features/main/home/add_offer/preview_screen.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/ui_components/app_button.dart';

class NoteToOwnerScreen extends StatefulWidget {
  const NoteToOwnerScreen({
    Key? key,
    required this.offer,
  }) : super(key: key);
  final OfferModel offer;
  @override
  State<NoteToOwnerScreen> createState() => _NoteToOwnerScreenState();
}

class _NoteToOwnerScreenState extends State<NoteToOwnerScreen> {
  String noteToOwner = "";

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
                  padding: EdgeInsets.zero,
                  children: [
                    const Text(
                      "Note to Owner:",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ).paddingOnly(bottom: 8),
                    TextField(
                      onChanged: (val) {
                        noteToOwner = val.trim();
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
                    ).paddingOnly(bottom: 15),
                    AppButton(
                      text: "Send",
                      onTap: () {},
                      bgColor: const Color(0xff575757),
                    ),
                    AppButton(
                      text: "Continue",
                      onTap: () {
                        GlobalNavigator.push(
                          context,
                          page: PreviewScreen(
                            offer: widget.offer.copyWith(
                              noteToOwner: noteToOwner,
                            ),
                          ),
                        );
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
}
