import 'package:alquran_cloud/src/entites/edition.dart';
import 'package:alquran_cloud/src/entites/surah.dart';
import 'package:equatable/equatable.dart';

class Quran extends Equatable {
  final List<Surah> surahs;
  final Edition edition;
  const Quran({
    required this.surahs,
    required this.edition,
  });

  Map<String, dynamic> toMap() {
    return {
      'surahs': surahs.map((x) => x.toMap()).toList(),
      'edition': edition.toMap(),
    };
  }

  factory Quran.fromMap(Map<String, dynamic> map) {
    return Quran(
      surahs: (map['surahs'] as List).map((x) => Surah.fromMap(x as Map<String, dynamic>)).toList(),
      edition: Edition.fromMap(map['edition'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object> get props => [surahs, edition];
}
