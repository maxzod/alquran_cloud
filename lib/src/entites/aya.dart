import 'package:equatable/equatable.dart';

import 'package:alquran_cloud/src/entites/edition.dart';

class Aya extends Equatable {
  final int number;
  final String text;
  final Edition edition;
  final int numberInSurah;
  final int juz;
  final int manzil;
  final int page;
  final int ruku;
  final int hizbQuarter;
  final bool sajda;
  final String? audio;
  final List<String>? audioSecondary;

  const Aya({
    required this.number,
    required this.text,
    required this.edition,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
    required this.audio,
    required this.audioSecondary,
  });

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'text': text,
      'edition': edition.toMap(),
      'numberInSurah': numberInSurah,
      'juz': juz,
      'manzil': manzil,
      'page': page,
      'ruku': ruku,
      'hizbQuarter': hizbQuarter,
      'sajda': sajda,
      if (audio != null) 'audio': audio,
      if (audioSecondary != null) 'audioSecondary': audioSecondary,
    };
  }

  factory Aya.fromMap(Map<String, dynamic> map) {
    return Aya(
      number: map['number'] as int,
      text: map['text'] as String,
      edition: Edition.fromMap(map['edition'] as Map<String, dynamic>),
      numberInSurah: map['numberInSurah'] as int,
      juz: map['juz'] as int,
      manzil: map['manzil'] as int,
      page: map['page'] as int,
      ruku: map['ruku'] as int,
      hizbQuarter: map['hizbQuarter'] as int,
      sajda: map['sajda'] as bool,
      audio: map['audio'] as String?,
      audioSecondary: map['audioSecondary'] as List<String>?,
    );
  }

  @override
  List<Object> get props {
    return [
      number,
      text,
      edition,
      numberInSurah,
      juz,
      manzil,
      page,
      ruku,
      hizbQuarter,
      sajda,
      if (audio != null) audio!,
      if (audioSecondary != null) audioSecondary!,
    ];
  }
}
