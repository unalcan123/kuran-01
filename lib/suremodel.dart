// To parse this JSON data, do
//
//     final kuran = kuranFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Kuran kuranFromJson(String str) => Kuran.fromJson(json.decode(str));

String kuranToJson(Kuran data) => json.encode(data.toJson());

class Kuran {
  Kuran({
    required this.data,
  });

  final Data data;

  factory Kuran.fromJson(Map<String, dynamic> json) => Kuran(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.slug,
    required this.verseCount,
    required this.pageNumber,
    required this.audio,
    required this.zero,
    required this.verses,
  });

  final int id;
  final String name;
  final String slug;
  final int verseCount;
  final int pageNumber;
  final Audio audio;
  final dynamic zero;
  final List<Verse> verses;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        verseCount: json["verse_count"],
        pageNumber: json["pageNumber"],
        audio: Audio.fromJson(json["audio"]),
        zero: json["zero"],
        verses: List<Verse>.from(json["verses"].map((x) => Verse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "verse_count": verseCount,
        "pageNumber": pageNumber,
        "audio": audio.toJson(),
        "zero": zero,
        "verses": List<dynamic>.from(verses.map((x) => x.toJson())),
      };
}

class Audio {
  Audio({
    required this.mp3,
    required this.duration,
  });

  final String mp3;
  final int duration;

  factory Audio.fromJson(Map<String, dynamic> json) => Audio(
        mp3: json["mp3"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "mp3": mp3,
        "duration": duration,
      };
}

class Verse {
  Verse({
    required this.id,
    required this.surahId,
    required this.verseNumber,
    required this.verse,
    required this.page,
    required this.juzNumber,
    required this.transcription,
    required this.translation,
  });

  final int id;
  final int surahId;
  final int verseNumber;
  final String verse;
  final int page;
  final int juzNumber;
  final String transcription;
  final Translation translation;

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        id: json["id"],
        surahId: json["surah_id"],
        verseNumber: json["verse_number"],
        verse: json["verse"],
        page: json["page"],
        juzNumber: json["juzNumber"],
        transcription: json["transcription"],
        translation: Translation.fromJson(json["translation"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "surah_id": surahId,
        "verse_number": verseNumber,
        "verse": verse,
        "page": page,
        "juzNumber": juzNumber,
        "transcription": transcription,
        "translation": translation.toJson(),
      };
}

class Translation {
  Translation({
    required this.id,
    required this.author,
    required this.text,
    required this.footnotes,
  });

  final int id;
  final Author author;
  final String text;
  final dynamic footnotes;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        id: json["id"],
        author: Author.fromJson(json["author"]),
        text: json["text"],
        footnotes: json["footnotes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author.toJson(),
        "text": text,
        "footnotes": footnotes,
      };
}

class Author {
  Author({
    required this.id,
    required this.name,
    required this.description,
    required this.language,
  });

  final int id;
  final String name;
  final String description;
  final String language;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "language": language,
      };
}
