// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:king/data/models/transport_model.dart';
import 'package:king/data/parsers/transport_parser.dart';

class OfferModel {
  final Transport transportType;
  final int cost;
  final String whoRent;
  final String paymentMode;
  final String? noteToOwner;
  final String? comment;
  OfferModel({
    required this.transportType,
    required this.cost,
    required this.whoRent,
    required this.paymentMode,
    this.noteToOwner,
    this.comment,
  });

  OfferModel copyWith({
    Transport? transportType,
    int? cost,
    String? whoRent,
    String? paymentMode,
    String? noteToOwner,
    String? comment,
  }) {
    return OfferModel(
      transportType: transportType ?? this.transportType,
      cost: cost ?? this.cost,
      whoRent: whoRent ?? this.whoRent,
      paymentMode: paymentMode ?? this.paymentMode,
      noteToOwner: noteToOwner ?? this.noteToOwner,
      comment: comment ?? this.comment,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'transportType': transportType.name,
      'cost': cost,
      'whoRent': whoRent,
      'paymentMode': paymentMode,
      'noteToOwner': noteToOwner,
      'comment': comment,
    };
  }

  factory OfferModel.fromMap(Map<String, dynamic> map) {
    return OfferModel(
      transportType: TransportParser.parse(map['transportType']),
      cost: map['cost'] as int,
      whoRent: map['whoRent'] as String,
      paymentMode: map['paymentMode'] as String,
      noteToOwner: map['noteToOwner'] != null ? map['noteToOwner'] as String : null,
      comment: map['comment'] != null ? map['comment'] as String : null,
    );
  }

}
