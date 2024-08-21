import 'package:flutter/material.dart';
import 'package:king/app/global_navigator/global_navigator.dart';
import 'package:king/core/constants/app_icons.dart';
import 'package:king/core/extensions/expanded_ext_on_widget.dart';
import 'package:king/core/extensions/hidekeyboard_ext_on_context.dart';
import 'package:king/core/extensions/padding_extension_on_widget.dart';
import 'package:king/core/ui_components/app_button.dart';
import 'package:king/data/models/motorcycle.dart';
import 'package:king/data/models/offer_model.dart';
import 'package:king/data/models/passanger_car.dart';
import 'package:king/data/models/transport_model.dart';
import 'package:king/data/models/truck.dart';
import 'package:king/features/main/home/add_offer/components/transport_type.dart';
import 'package:king/features/main/home/add_offer/note_to_owner_screen.dart';

class AddOfferScreen extends StatefulWidget {
  const AddOfferScreen({super.key});

  @override
  State<AddOfferScreen> createState() => _AddOfferScreenState();
}

class _AddOfferScreenState extends State<AddOfferScreen> {
  Transport? transport;
  int cost = 0;
  String whoRent = "";
  String paymentMode = "Daily";

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
                    )
                  ],
                ).paddingOnly(bottom: 10),
                ListView(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  children: [
                    const Text(
                      "Select the type of transportat",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ).paddingOnly(bottom: 8),
                    TransportTypeWidget(
                      transportType: const Truck(),
                      isSelected: transport == const Truck(),
                      onTap: () {
                        setState(() {
                          transport = const Truck();
                        });
                      },
                    ).paddingOnly(bottom: 16),
                    TransportTypeWidget(
                      transportType: const PassangerCar(),
                      isSelected: transport == const PassangerCar(),
                      onTap: () {
                        setState(() {
                          transport = const PassangerCar();
                        });
                      },
                    ).paddingOnly(bottom: 16),
                    TransportTypeWidget(
                      transportType: const Motorcycle(),
                      isSelected: transport == const Motorcycle(),
                      onTap: () {
                        setState(() {
                          transport = const Motorcycle();
                        });
                      },
                    ).paddingOnly(bottom: 24),
                    const Text(
                      "Rental Cost",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ).paddingOnly(bottom: 8),
                    _tf(
                      (p0) {
                        cost = int.tryParse(p0.trim()) ?? cost;
                      },
                      TextInputType.number,
                    ).paddingOnly(bottom: 24),
                    const Text(
                      "Who rents from your?",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ).paddingOnly(bottom: 8),
                    _tf((p0) {
                      whoRent = p0.trim();
                    }).paddingOnly(bottom: 24),
                    const Text(
                      "How often payment is made?",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ).paddingOnly(bottom: 8),
                    Container(
                      width: double.maxFinite,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: const Color(0xff222222),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      child: DropdownButton(
                        elevation: 0,
                        isExpanded: true,
                        underline: const SizedBox(),
                        iconEnabledColor: Colors.white,
                        icon: const RotatedBox(
                          quarterTurns: 1,
                          child: Icon(Icons.chevron_right),
                        ),
                        dropdownColor: Colors.black,
                        items: ["Daily", "Weakly", "Monthly"]
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        value: paymentMode,
                        onChanged: (value) {
                          paymentMode = value ?? paymentMode;
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ).expanded(),
                AppButton(
                  text: "Continue",
                  onTap: () {
                    if (transport != null && cost > 0 && whoRent.isNotEmpty) {
                      final offer = OfferModel(
                        transportType: transport!,
                        cost: cost,
                        whoRent: whoRent,
                        paymentMode: paymentMode,
                      );
                      GlobalNavigator.push(context,
                          page: NoteToOwnerScreen(offer: offer));
                    }
                  },
                ).paddingSymetric(vertical: 15),
              ],
            ).paddingSymetric(horizontal: 20, vertical: 10),
          ),
        ),
      ),
    );
  }

  Widget _tf(void Function(String) onChanged,
      [TextInputType keyboardType = TextInputType.name]) {
    return TextField(
      onChanged: onChanged,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
    );
  }
}
