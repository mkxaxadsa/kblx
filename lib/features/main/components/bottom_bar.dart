// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:king/core/constants/app_icons.dart';
import 'package:king/core/extensions/mediaquery_ext_on_context.dart';
import 'package:king/core/extensions/padding_extension_on_widget.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
    required this.currentPageIndex,
    required this.onChanged,
  }) : super(key: key);
  final int currentPageIndex;
  final void Function(int) onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15 + context.padding.bottom),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: Color(0xff333333),
      ),
      child: Row(
        children: [
          const Spacer(
            flex: 1,
          ),
          _item(icon: AppIcons.home, label: "Home", index: 0),
          const Spacer(),
          _item(icon: AppIcons.news, label: "News", index: 1),
          const Spacer(),
          _item(icon: AppIcons.settings, label: "Settings", index: 2),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }

  Widget _item({
    required String icon,
    required String label,
    required int index,
  }) {
    final isSelected = index == currentPageIndex;
    return GestureDetector(
      onTap: () {
        onChanged(index);
      },
      child: Container(
        width: 56,
        height: 56,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 24,
              color: isSelected ? const Color(0xffFFA20D) : Colors.white,
            ).paddingOnly(bottom: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: isSelected ? const Color(0xffFFA20D) : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
