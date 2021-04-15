import 'package:alquran_cloud/src/entites/aya.dart';
import 'package:alquran_cloud/src/entites/edition.dart';
import 'package:alquran_cloud/src/entites/juz.dart';
import 'package:alquran_cloud/src/entites/quran.dart';
import 'package:alquran_cloud/src/wrapper.dart';
import 'package:alquran_cloud/src/entites/surah.dart';

/// contains the entire endpoints for the alquran_cloud api
/// `endpoints` [
///  Editions
///  Quran
///  Juz
///  Surah
///  Aya
/// ]
///
///

/// ? Edition Endpoints

/// Lists all available editions. You can filter the results using the parameters below.
/// `format` - Specify a format. 'text' or 'audio'
/// `language` - A 2 digit language code. Example: '`en`', '`fr`', etc.
/// `type` - A valid type. Example - 'versebyverse', 'translation' etc.
Future<List<Edition>> getEditions(
  int ayaNumber,
  Edition edition, {
  String? format,
  String? language,
  String? type,
}) async {
  final res = await get('/edition', query: {
    if (format != null) 'format': format,
    if (language != null) 'language': language,
    if (type != null) 'type': type,
  });
  return (res['data'] as List<Map<String, dynamic>>)
      .map<Edition>((e) => Edition.fromMap(e))
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
  return (res['data'] as List<Map<String, dynamic>>)
      .map<Edition>((e) => Edition.fromMap(e))
      .toList();
}

/// Lists all editions for a given type
/// `type` can be 'translation', 'tafsir' or another result returned in 4 above
Future<List<Edition>> getAllEditionsForType(String type) async {
  final res = await get('/edition/type/$type');
  return (res['data'] as List<Map<String, dynamic>>)
      .map<Edition>((e) => Edition.fromMap(e))
      .toList();
}

/// Lists all editions for a given type
/// `type` can be 'translation', 'tafsir' or another result returned in 4 above
Future<List<Edition>> getAllEditionsByFormat(String format) async {
  final res = await get('/edition/format/$format');
  return (res['data'] as List<Map<String, dynamic>>)
      .map<Edition>((e) => Edition.fromMap(e))
      .toList();
}

/// ? Alquran
/// Returns a complete `Quran` edition in the audio or text format
Future<Quran> getQuranByEdition(Edition edition) async {
  final res = await get('/quran/${edition.identifier}');
  return Quran.fromMap(res['data'] as Map<String, dynamic>);
}

/// ? Juz

/// Returns the requested juz from a particular edition
/// offset - offset ayahs in a juz by the given number
/// limit - This is the number of ayahs that the response will be limited to.
Future<Juz> getJuzByNumber(
  int juzNumber,
  Edition edition, {
  int? offset,
  int? limit,
}) async {
  final res = await get(
    '/juz/$juzNumber/${edition.identifier}',
    query: {'limit': limit, 'offset': offset},
  );
  return Juz.fromMap(res['data'] as Map<String, dynamic>);
}

/// ? Surah
/// Returns the list of Surahs in the Quran
/// offset - offset ayahs in a juz by the given number
/// limit - This is the number of ayahs that the response will be limited to.
Future<List<Surah>> getQuranSurahs({
  int? offset,
  int? limit,
}) async {
  final res = await get('/surah', query: {'limit': limit, 'offset': offset});
  return (res['data'] as List<Map<String, dynamic>>)
      .map<Surah>((e) => Surah.fromMap(e))
      .toList();
}

/// Returns the requested surah from a particular edition
Future<Surah> getSurahByEdition(Edition edition) async {
  final res = await get('/surah/${edition.identifier}');
  return Surah.fromMap(res['data'] as Map<String, dynamic>);
}

/// ? Aya
/// Returns an ayah for a given edition.
Future<Aya> getAyaByNumber(int ayaNumber, Edition edition) async {
  final res = await get('/ayah/$ayaNumber/${edition.identifier}');
  return Aya.fromMap(res['data'] as Map<String, dynamic>);
}

// /// ? Search
// /// Returns ayahs that match a keyword in a given edition or language.
// /// If you do not specify an edition or language, all english language texts are searched.
// /// `surah` Enter a surah number (between 1 and 114) to search a specific surah or 'all' to search all the text
// /// `edition`is an edition identifier. Example: en.asad for Muhammad Asad's english translation
// /// `language` is 2 digit alpha language code. Example: en for English, fr for french

// Future<List<Aya>> search(
//   String keyword, {
//   int? offset,
//   int? limit,
// }) async {
//   final res = await get('/search/$keyword', query: {'limit': limit, 'offset': offset});
//   return (res['data'] as List<Map<String, dynamic>>).map<Aya>((e) => Aya.fromMap(e)).toList();
// }
