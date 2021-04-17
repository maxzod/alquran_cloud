import 'package:alquran_cloud/alquran_cloud.dart';
import 'package:alquran_cloud/src/wrapper.dart';

/// Returns an ayah for a given edition.
Future<Aya> getAyaByNumber(int ayaNumber, Edition edition) async {
  final res = await get('/ayah/$ayaNumber/${edition.identifier}');
  return Aya.fromMap(res['data'] as Map<String, dynamic>);
}

/// Returns the requested surah from multiple editions
Future<List<Aya>> getAyaByMultiEdition(List<String> editions) async {
  assert(editions.isEmpty,
      '[error][getAyaByMultiEdition()] editions list can not be empty');
  final buffer = StringBuffer(editions.first);
  for (var i = 1; i < editions.length; i++) {
    buffer.write(',${editions[i]}');
  }
  final res = await get('/ayah/${buffer.toString()}');
  return (res['data'] as List)
      .map<Aya>((e) => Aya.fromMap(e as Map<String, dynamic>))
      .toList();
}
