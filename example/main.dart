import 'dart:developer';

import 'package:alquran_cloud/alquran_cloud.dart' as quran_cloud;

Future<void> main(List<String> args) async {
  // Cache still in progress
  //// to enable cache (enabled by default)
  quran_cloud.quranCloud.enableCache = true;

  /// use edition identifer to determine which edition of the quran to get
  final allEditions = await quran_cloud.getAllEditions();

  /// also you can query the edition you want
  final editionsQuery = await quran_cloud.getAllEditions(
    format: 'text', // or `audio`
    language: 'ar', // use .getEditionSupportedLanguages(); to get the all available languages
    type: 'quran', // user .getEditionTypes() to get all available types
  );

  /// get aya by number and edition
  final aya = await quran_cloud.getAyaByNumber(2, editionsQuery.first);

  log(aya.text); // الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ
}
