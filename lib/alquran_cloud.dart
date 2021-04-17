library alquran_cloud;

export 'package:alquran_cloud/src/entites/index.dart';
export 'package:alquran_cloud/src/repositories/index.dart';
export 'package:alquran_cloud/src/exception.dart';

class _AlquranCloud {
  bool enableCache = true;
}

_AlquranCloud quranCloud = _AlquranCloud();
