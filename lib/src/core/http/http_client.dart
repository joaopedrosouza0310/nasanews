import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class HttpClient {
  Future<Response> get(String url, {Map<String, dynamic>? queryParameters});
  Future<Response> post(String url, {Map<String, dynamic>? data});
  Future<Response> put(String url, {Map<String, dynamic>? data});
  Future<Response> delete(String url, {Map<String, dynamic>? data});
}

@Injectable(as: HttpClient)
class DioHttpClient implements HttpClient {
  final Dio _dio;

  DioHttpClient(this._dio);

  @override
  Future<Response> get(String url, {Map<String, dynamic>? queryParameters}) {
    return _dio.get(url, queryParameters: queryParameters);
  }

  @override
  Future<Response> post(String url, {Map<String, dynamic>? data}) {
    return _dio.post(url, data: data);
  }

  @override
  Future<Response> put(String url, {Map<String, dynamic>? data}) {
    return _dio.put(url, data: data);
  }

  @override
  Future<Response> delete(String url, {Map<String, dynamic>? data}) {
    return _dio.delete(url, data: data);
  }
}
