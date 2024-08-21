import 'package:hive_flutter/hive_flutter.dart';
import 'package:king/data/models/offer_model.dart';

class HiveHelper {
  static Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox("APP_BOX");
  }

  static late final Box _box;

  static bool get isFirstTimeOpen {
    return _box.get("is_first_time_open") ?? true;
  }

  static List<OfferModel> get offers {
    final resp = List.from(_box.get("offers") ?? []);
    final result = resp
        .map(
          (e) => OfferModel.fromMap(
            Map<String, dynamic>.from(Map.from(e)),
          ),
        )
        .toList();
    return result;
  }

  static Future<void> addOffer(OfferModel offer) async {
    await _box.put("offers", [...offers,offer].map((e) => e.toMap()).toList());
  }

  static Future<void> setIsNotFirstTimeOpen() async {
    await _box.put("is_first_time_open", false);
  }
}
