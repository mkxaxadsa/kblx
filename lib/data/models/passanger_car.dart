import 'package:king/core/constants/app_images.dart';
import 'package:king/data/models/transport_model.dart';

class PassangerCar extends Transport {
 const PassangerCar() : super(name: "Passenger car");
  
  @override
  String get image => AppImages.car;
}