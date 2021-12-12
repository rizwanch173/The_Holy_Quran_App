import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'package:al_quran/model/ayat/ayat.dart';

part 'surah.g.dart';

@HiveType(typeId: 6)
class Surah {
  @HiveField(0)
  final int? number;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? englishName;
  @HiveField(3)
  final String? englishNameTranslation;
  @HiveField(4)
  final String? revelationType;
  @HiveField(5)
  final List<Ayat>? ayahs;

  Surah({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.ayahs,
  });

  factory Surah.fromJSON(Map<String, dynamic> json) {
    Iterable ayahs = json['ayahs'];
    List<Ayat> ayahsList = ayahs.map((e) => Ayat.fromJSON((e))).toList();

    return Surah(
        name: json['name'],
        number: json['number'],
        englishName: json['englishName'],
        revelationType: json['revelationType'],
        englishNameTranslation: json['englishNameTranslation'],
        ayahs: ayahsList);
  }

  Surah copyWith({
    int? number,
    String? name,
    String? englishName,
    String? englishNameTranslation,
    String? revelationType,
    List<Ayat>? ayahs,
  }) {
    return Surah(
      number: number ?? this.number,
      name: name ?? this.name,
      englishName: englishName ?? this.englishName,
      englishNameTranslation:
          englishNameTranslation ?? this.englishNameTranslation,
      revelationType: revelationType ?? this.revelationType,
      ayahs: ayahs ?? this.ayahs,
    );
  }

  Surah merge(Surah model) {
    return Surah(
      number: model.number ?? this.number,
      name: model.name ?? this.name,
      englishName: model.englishName ?? this.englishName,
      englishNameTranslation:
          model.englishNameTranslation ?? this.englishNameTranslation,
      revelationType: model.revelationType ?? this.revelationType,
      ayahs: model.ayahs ?? this.ayahs,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'name': name,
      'englishName': englishName,
      'englishNameTranslation': englishNameTranslation,
      'revelationType': revelationType,
      'ayahs': ayahs?.map((x) => x.toMap()).toList(),
    };
  }

  factory Surah.fromMap(Map<String, dynamic> map) {
    return Surah(
      number: map['number'],
      name: map['name'],
      englishName: map['englishName'],
      englishNameTranslation: map['englishNameTranslation'],
      revelationType: map['revelationType'],
      ayahs: List<Ayat>.from(map['ayahs']?.map((x) => Ayat?.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Surah.fromJson(String source) => Surah.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Surah(number: $number, name: $name, englishName: $englishName, englishNameTranslation: $englishNameTranslation, revelationType: $revelationType, ayahs: $ayahs)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Surah &&
        o.number == number &&
        o.name == name &&
        o.englishName == englishName &&
        o.englishNameTranslation == englishNameTranslation &&
        o.revelationType == revelationType &&
        listEquals(o.ayahs, ayahs);
  }

  @override
  int get hashCode {
    return number.hashCode ^
        name.hashCode ^
        englishName.hashCode ^
        englishNameTranslation.hashCode ^
        revelationType.hashCode ^
        ayahs.hashCode;
  }
}