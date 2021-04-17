/// `edition` - An audio edition as returned by the API. (Example - ar.alafasy).
/// `number`  - An ayah number. the Quran contains 6236 ayahs, so this must be a number between 1 and 6236.
/// `quality` - Quality of audio served. Acceptable values are 'high' or 'low'.
String getAyaAudioUrl(String edition, int number,
    [String? quality = 'medium']) {
  return 'http://cdn.alquran.cloud/media/audio/ayah/$edition/$number${quality == null ? '' : '/$quality'}';
}

/// `surah` - A surah number (from 1 to 114)
/// `ayah`  - An ayah number relative to the surah
String getAyaImageUrl(int surah, int ayah) {
  return 'https://cdn.islamic.network/quran/images/${surah}_$ayah.png';
}
