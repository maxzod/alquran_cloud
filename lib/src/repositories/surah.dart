import 'package:alquran_cloud/alquran_cloud.dart';
import 'package:alquran_cloud/src/wrapper.dart';

/// Returns the list of Surahs in the Quran
/// offset - offset ayahs in a juz by the given number
/// limit - This is the number of ayahs that the response will be limited to.
Future<List<Surah>> getQuranSurahs({
  int? offset,
  int? limit,
}) async {
  final res = await get('/surah', query: {'limit': limit, 'offset': offset});
  return (res['data'] as List).map<Surah>((e) => Surah.fromMap(e as Map<String, dynamic>)).toList();
}

/// Returns the requested surah from a particular edition
Future<Surah> getSurahByEdition(int id, Edition edition) async {
  final res = await get('/surah/$id/${edition.identifier}');
  return Surah.fromMap(res['data'] as Map<String, dynamic>);
}

/// Returns the requested surah from multiple editions
Future<List<Surah>> getSurahByMultiEdition(List<String> editions) async {
  assert(editions.isEmpty, '[error][getSurahByEdition()] editions list can not be empty');
  final buffer = StringBuffer(editions.first);
  for (var i = 1; i < editions.length; i++) {
    buffer.write(',${editions[i]}');
  }
  final res = await get('/surah/${buffer.toString()}');
  return (res['data'] as List).map<Surah>((e) => Surah.fromMap(e as Map<String, dynamic>)).toList();
}
