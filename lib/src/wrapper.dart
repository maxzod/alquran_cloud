import 'package:alquran_cloud/alquran_cloud.dart';
import 'package:dio/dio.dart';
import 'package:alquran_cloud/src/exception.dart';

Future<dynamic> get(String url, {Map<String, dynamic>? query}) async {
  try {
    final _dio = Dio(BaseOptions(
      baseUrl: 'http://api.alquran.cloud/v1',
      followRedirects: true,
      validateStatus: (statusCode) => statusCode != null && statusCode == 200,
    ));

    if (quranCloud.enableCache) {
      // TODO :: Cache interceptors
      // _dio.interceptors.add(element)
    }
    return (await _dio.get(url, queryParameters: query)).data;
  } on QuranCloudException {
    rethrow;
  } catch (e) {
    throw QuranCloudException(e);
  }
}
