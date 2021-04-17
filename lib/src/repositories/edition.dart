import 'package:alquran_cloud/alquran_cloud.dart';
import 'package:alquran_cloud/src/wrapper.dart';

/// ? Edition Endpoints

/// Lists all available editions. You can filter the results using the parameters below.
/// `format` - Specify a format. 'text' or 'audio'
/// `language` - A 2 digit language code. Example: '`en`', '`fr`', etc.
/// `type` - A valid type. Example - 'versebyverse', 'translation' etc.
Future<List<Edition>> getAllEditions({
  String? format,
  String? language,
  String? type,
}) async {
  final res = await get('/edition', query: {
    if (format != null) 'format': format,
    if (language != null) 'language': language,
    if (type != null) 'type': type,
  });
  return (res['data'] as List)
      .map<Edition>((e) => Edition.fromMap(e as Map<String, dynamic>))
      .toList();
}

/// Lists all languages in which editions are available
Future<List<String>> getEditionSupportedLanguages() async {
  final res = await get('/edition/language');
  return res['data'] as List<String>;
}

/// Lists all types of editions
Future<List<String>> getEditionTypes() async {
  final res = await get('/edition/type');
  return res['data'] as List<String>;
}

/// Lists all formats
Future<List<String>> getEditionFormat() async {
  final res = await get('/edition/format');
  return res['data'] as List<String>;
}

/// Lists all editions for a given language
/// `language` - is a 2 digit language code. Example: en for English, fr for French, ar for Arabic
Future<List<Edition>> getAllEditionsForLanguage(String language) async {
  final res = await get('/edition/language/$language');
  return (res['data'] as List)
      .map<Edition>((e) => Edition.fromMap(e as Map<String, dynamic>))
      .toList();
}

/// Lists all editions for a given type
/// `type` can be 'translation', 'tafsir' or another result returned in 4 above
Future<List<Edition>> getAllEditionsForType(String type) async {
  final res = await get('/edition/type/$type');
  return (res['data'] as List)
      .map<Edition>((e) => Edition.fromMap(e as Map<String, dynamic>))
      .toList();
}

/// Lists all editions for a given type
/// `type` can be 'translation', 'tafsir' or another result returned in 4 above
Future<List<Edition>> getAllEditionsByFormat(String format) async {
  final res = await get('/edition/format/$format');
  return (res['data'] as List)
      .map<Edition>((e) => Edition.fromMap(e as Map<String, dynamic>))
      .toList();
}
