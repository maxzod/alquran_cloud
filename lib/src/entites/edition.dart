import 'package:equatable/equatable.dart';

class Edition extends Equatable {
  final String identifier;
  final String language;
  final String name;
  final String englishName;
  final String format;
  final String type;
  final String? tafsir;

  const Edition({
    required this.identifier,
    required this.language,
    required this.name,
    required this.englishName,
    required this.format,
    required this.type,
    required this.tafsir,
  });

  Map<String, dynamic> toMap() {
    return {
      'identifier': identifier,
      'language': language,
      'name': name,
      'englishName': englishName,
      'format': format,
      'type': type,
      'tafsir': tafsir,
    };
  }

  factory Edition.fromMap(Map<String, dynamic> map) {
    return Edition(
      identifier: map['identifier'] as String,
      language: map['language'] as String,
      name: map['name'] as String,
      englishName: map['englishName'] as String,
      format: map['format'] as String,
      type: map['type'] as String,
      tafsir: map['tafsir'] as String?,
    );
  }

  @override
  List<Object> get props {
    return [
      identifier,
      language,
      name,
      englishName,
      format,
      type,
      if (tafsir != null) tafsir!,
    ];
  }
}
