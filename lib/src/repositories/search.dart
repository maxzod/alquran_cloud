import 'package:alquran_cloud/quran_api.dart';
import 'package:alquran_cloud/src/wrapper.dart';

/// Returns ayahs that match a keyword in a given edition or language.
/// If you do not specify an edition or language, all english language texts are searched.
/// `surah` Enter a surah number (between 1 and 114) to search a specific surah or 'all' to search all the text
/// `edition`is an edition identifier. Example: en.asad for Muhammad Asad's english translation
/// `language` is 2 digit alpha language code. Example: en for English, fr for french

Future<List<Aya>> search({
  required String keyword,
  required int surah,
  String? language,
  String? edition,
}) async {
  assert(language != null && edition != null, '''
  [error][search()] language or edition one of them must be null
  you cant search with both at the same time
  ''');
  final res = await get('/search/$keyword/{{surah}}/${language ?? edition ?? ''}');
  return (res['data'] as List).map<Aya>((e) => Aya.fromMap(e as Map<String, dynamic>)).toList();
}
