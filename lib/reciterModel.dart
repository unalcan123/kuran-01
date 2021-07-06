// To parse this JSON data, do
//
//     final reciters = recitersFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Reciters recitersFromJson(String str) => Reciters.fromJson(json.decode(str));

String recitersToJson(Reciters data) => json.encode(data.toJson());

class Reciters {
  Reciters({
    required this.reciters,
  });

  final List<Reciter> reciters;

  factory Reciters.fromJson(Map<String, dynamic> json) => Reciters(
        reciters: List<Reciter>.from(
            json["reciters"].map((x) => Reciter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "reciters": List<dynamic>.from(reciters.map((x) => x.toJson())),
      };
}

class Reciter {
  Reciter({
    required this.id,
    required this.name,
    required this.server,
    required this.rewaya,
    required this.count,
    required this.letter,
    required this.suras,
  });

  final String id;
  final String name;
  final String server;
  final String rewaya;
  final String count;
  final String letter;
  final String suras;

  factory Reciter.fromJson(Map<String, dynamic> json) => Reciter(
        id: json["id"],
        name: json["name"],
        server: json["Server"],
        rewaya: json["rewaya"],
        count: json["count"],
        letter: json["letter"],
        suras: json["suras"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "Server": server,
        "rewaya": rewaya,
        "count": count,
        "letter": letter,
        "suras": suras,
      };
}
