import 'package:king/core/constants/app_images.dart';
import 'package:king/data/models/transport_model.dart';

class Motorcycle extends Transport {
  const Motorcycle() : super(name: "Motorcycle");
  
  @override
  String get image => AppImages.motorcycle;
}