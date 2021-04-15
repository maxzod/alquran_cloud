import 'package:alquran_cloud/alquran_cloud.dart';
import 'package:dio/dio.dart';
import 'package:alquran_cloud/src/exception.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Future<dynamic> get(String url, {Map<String, dynamic>? query}) async {
  try {
    final _dio = Dio(BaseOptions(
      baseUrl: 'http://api.alquran.cloud/v1',
      followRedirects: true,
      validateStatus: (_) => true,
    ));
    if (quranCloud.enableLogs) {
      _dio.interceptors.add(PrettyDioLogger());
    }
    if (quranCloud.enableCache) {
      // TODO :: Cache interceptors
      // _dio.interceptors.add(element)
    }

    final res = await _dio.get(url, queryParameters: query);
    if (res.statusCode == 200) {
      return res.data;
    } else {
      throw QuranCloudException(res.data, res.statusCode);
    }
  } on QuranCloudException {
    rethrow;
  } catch (e) {
    throw QuranCloudException(e);
  }
}
