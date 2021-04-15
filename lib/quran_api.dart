library quran_api;

export 'package:alquran_cloud/src/entites/index.dart';
export 'package:alquran_cloud/src/repositories/index.dart';

class _AlquranCloud {
  bool enableLogs = false;
  bool enableCache = true;
}

_AlquranCloud quranCloud = _AlquranCloud();
