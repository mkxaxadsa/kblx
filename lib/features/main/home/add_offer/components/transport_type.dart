// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:king/core/constants/app_icons.dart';
import 'package:king/core/extensions/align_ext_on_widget.dart';
import 'package:king/core/extensions/expanded_ext_on_widget.dart';

import 'package:king/data/models/transport_model.dart';

class TransportTypeWidget extends StatelessWidget {
  const TransportTypeWidget({
    Key? key,
    required this.transportType,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);
  final Transport transportType;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        height: 72,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: const Color(0xff222222),
          border: isSelected ? Border.all(color: const Color(0xffFFA20D)) : null,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            SizedBox(
              width: 105,
              child: Image.asset(
                transportType.image,
                height: 34,
              ).align(Alignment.centerLeft),
            ),
            Text(
              transportType.name,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ).expanded(),
            Image.asset(
              AppIcons.check,
              width: 24,
              color: isSelected ? const Color(0xffFFA20D) : const Color(0xff333333),
            ),
          ],
        ),
      ),
    );
  }
}
