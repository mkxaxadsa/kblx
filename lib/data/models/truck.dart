import 'package:king/core/constants/app_images.dart';
import 'package:king/data/models/transport_model.dart';

class Truck extends Transport {
  const Truck():super(name: "Truck");
  
  @override
  String get image => AppImages.truck;

}