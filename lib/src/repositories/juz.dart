import 'package:alquran_cloud/alquran_cloud.dart';

import 'package:alquran_cloud/src/wrapper.dart';

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
