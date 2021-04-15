import 'package:dio/dio.dart';
import 'package:alquran_cloud/src/exception.dart';

final _dio = Dio(
    BaseOptions(baseUrl: 'http://api.alquran.cloud/v1', followRedirects: true));

Future<dynamic> get(String url, {Map<String, dynamic>? query}) async {
  final res = await _dio.get(url, queryParameters: query);
  if (res.statusCode == 200) {
    return res.data;
  } else {
    throw MuslimException(res.data, res.statusCode);
  }
}
