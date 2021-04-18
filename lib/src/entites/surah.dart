import 'package:alquran_cloud/alquran_cloud.dart';
import 'package:equatable/equatable.dart';

class Surah extends Equatable {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final int? numberOfAyahs;
  final String revelationType;
  final List<Aya>? ayahs;
  const Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.numberOfAyahs,
    required this.revelationType,
    this.ayahs,
  });

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'name': name,
      'englishName': englishName,
      'englishNameTranslation': englishNameTranslation,
      'numberOfAyahs': numberOfAyahs,
      'revelationType': revelationType,
      'ayahs': ayahs,
    };
  }

  factory Surah.fromMap(Map<String, dynamic> map) {
    return Surah(
      number: map['number'] as int,
      name: map['name'] as String,
      englishName: map['englishName'] as String,
      englishNameTranslation: map['englishNameTranslation'] as String,
      numberOfAyahs: map['numberOfAyahs'] as int?,
      revelationType: map['revelationType'] as String,
      ayahs: (map['ayahs'] as List).map((x) => Aya.fromMap(x as Map<String, dynamic>)).toList(),
    );
  }

  @override
  List<Object> get props {
    return [
      number,
      name,
      englishName,
      englishNameTranslation,
      if (numberOfAyahs != null) numberOfAyahs!,
      revelationType,
    ];
  }
}
