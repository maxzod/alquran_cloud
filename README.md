# Alquran Cloud

unofficial api wrapper for the free islamic api alquran.cloud
usage

```dart
void main(List<String> args) async {
  /// to enable logs (disabled by default)
  quran_cloud.quranCloud.enableLogs = true;

  /// use edition identifer to determine which edition of the quran to get
  final allEditions = await quran_cloud.getAllEditions();

  /// also you can query the edition you want
  final editionsQuery = await quran_cloud.getAllEditions(
    format: 'text', // or `audio`
    language: 'ar', // use .getEditionSupportedLanguages(); to get the all available languages
    type: 'quran', // user .getEditionTypes() to get all available types
  );

  final quran = await quran_cloud.getQuranByEdition(allEditions.first);

  /// get surah by number and edition
  final surah = await quran_cloud.getSurahByEdition(1, editionsQuery.first);

  /// get aya by number and edition
  final aya = await quran_cloud.getAyaByNumber(2, editionsQuery.first);

  print(aya.text); // الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ
```

# Endpoints

- [x] Editions
- [x] Quran
- [x] Juz
- [x] Surah
- [x] Aya
- [ ] Manzil
- [ ] Ruku
- [ ] Page
- [ ] Hizb
- [ ] Quarter
- [ ] Sajda
- [ ] Meta

# Features

- [ ] cache (awaiting this PR https://github.com/hurshi/dio-http-cache/pull/84)
- [ ] prayer times
- [ ] docs
- [ ] re-tray
