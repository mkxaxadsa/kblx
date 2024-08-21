import 'package:king/data/models/motorcycle.dart';
import 'package:king/data/models/passanger_car.dart';
import 'package:king/data/models/transport_model.dart';
import 'package:king/data/models/truck.dart';

class TransportParser {
 static  Transport parse(String name) {
  switch(name){
    case "Truck": return Truck();
    case "Motorcycle": return Motorcycle();
    default: return PassangerCar();
  }
 }
}