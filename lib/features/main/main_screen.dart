import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:king/core/extensions/expanded_ext_on_widget.dart';
import 'package:king/features/main/components/bottom_bar.dart';
import 'package:king/features/main/home/home_screen.dart';
import 'package:king/features/main/news/news_screen.dart';
import 'package:king/features/main/settings/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final pages = [
    const HomeScreen(),
    const NewsScreen(),
    const SettingsScreen(),
  ];

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              pages[currentPageIndex].expanded(),
              BottomBar(
                currentPageIndex: currentPageIndex,
                onChanged: (p0) {
                  setState(() {
                    currentPageIndex = p0;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
