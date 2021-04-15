import 'package:equatable/equatable.dart';

import 'package:alquran_cloud/src/entites/aya.dart';
import 'package:alquran_cloud/src/entites/edition.dart';
import 'package:alquran_cloud/src/entites/surah.dart';

class Juz extends Equatable {
  final int number;
  final List<Aya> ayahs;
  final List<Surah> surahs;
  final Edition edition;
  const Juz({
    required this.number,
    required this.ayahs,
    required this.surahs,
    required this.edition,
  });

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'ayahs': ayahs.map((x) => x.toMap()).toList(),
      'surahs': surahs.map((x) => x.toMap()).toList(),
      'edition': edition.toMap(),
    };
  }

  factory Juz.fromMap(Map<String, dynamic> map) {
    return Juz(
      number: map['number'] as int,
      ayahs: (map['ayahs'] as List<Map<String, dynamic>>)
          .map<Aya>((x) => Aya.fromMap(x))
          .toList(),
      surahs: (map['surahs'] as List<Map<String, dynamic>>)
          .map<Surah>((x) => Surah.fromMap(x))
          .toList(),
      edition: Edition.fromMap(map['edition'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object> get props => [number, ayahs, surahs, edition];
}
