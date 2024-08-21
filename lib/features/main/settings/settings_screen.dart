import 'package:flutter/material.dart';
import 'package:king/core/constants/app_icons.dart';
import 'package:king/core/extensions/expanded_ext_on_widget.dart';
import 'package:king/core/extensions/padding_extension_on_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: [
        const Text(
          "Settings",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ).paddingOnly(bottom: 20),
        _item(
          "Terms Conditions",
          onTap: () => _launchUrl(
              'https://docs.google.com/document/d/1_a7iOCavQvePyo7tVLDeSMNLKrvsClycD2f6whXdeZQ/edit?usp=sharing'),
        ).paddingOnly(bottom: 16),
        _item(
          "Write Support",
          onTap: () => _launchUrl('https://forms.gle/zcdxKPXiw7a8PHE89'),
        ).paddingOnly(bottom: 16),
        _item(
          "Privacy Policy",
          onTap: () => _launchUrl(
              'https://docs.google.com/document/d/1516-RRc2TRFVY7_RZDdTnXIosYBqzu9_KWqRCCV-KJk/edit?usp=sharing'),
        ).paddingOnly(bottom: 16),
      ],
    );
  }

  Widget _item(String name, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        height: 64,
        decoration: BoxDecoration(
          color: const Color(0xff222222),
          borderRadius: BorderRadius.circular(14),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ).expanded(),
            Image.asset(
              AppIcons.arrowRight,
              width: 24,
            ),
          ],
        ),
      ),
    );
  }
}
