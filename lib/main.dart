import 'package:flutter/material.dart';
import 'package:king/app/app.dart';
import 'package:king/data/helpers/hive_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveHelper.init();
  runApp(const KingBillyApp());
}