import 'package:flutter/material.dart';

import '../features/splash/splash_screen.dart';

class KingBillyApp extends StatefulWidget {
  const KingBillyApp({super.key});

  @override
  State<KingBillyApp> createState() => _KingBillyAppState();
}

class _KingBillyAppState extends State<KingBillyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xff090907),
      ),
    );
  }
}
