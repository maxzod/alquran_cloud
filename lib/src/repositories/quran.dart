import 'package:alquran_cloud/quran_api.dart';

import 'package:alquran_cloud/src/wrapper.dart';

/// Returns a complete `Quran` edition in the audio or text format
Future<Quran> getQuranByEdition(Edition edition) async {
  final res = await get('/quran/${edition.identifier}');
  return Quran.fromMap(res['data'] as Map<String, dynamic>);
}
