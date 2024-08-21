// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:king/core/extensions/padding_extension_on_widget.dart';
import 'package:king/core/utils/time_format_changer.dart';
import 'package:king/data/models/offer_model.dart';


class OfferWidget extends StatelessWidget {
  const OfferWidget({
    Key? key,
    required this.offer,
  }) : super(key: key);
  final OfferModel offer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: const Color(0xff333333),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Image.asset(
            offer.transportType.image,
            width: double.maxFinite,
          ),
          const Spacer(),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  offer.noteToOwner ?? "",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ).paddingOnly(bottom: 5),
                Text(
                  offer.whoRent,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ).paddingOnly(bottom: 5),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "\$${offer.cost} ",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffFFA20D),
                        ),
                      ),
                      TextSpan(
                        text: "/per ${timeFormatChanger(offer.paymentMode)}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          color: Color(0xffFFA20D),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
