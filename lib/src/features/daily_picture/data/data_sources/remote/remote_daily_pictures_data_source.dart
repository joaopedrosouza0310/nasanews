import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:nasanews/src/features/daily_picture/data/data.dart';

import '../../../../../core/core.dart';

enum RemoteRequestResult {
  unableToRetrieveData,
  httpError,
  jsonFormatError,
  networkError,
  typeError,
  envDataNotDefined
}

abstract interface class RemoteDailyPicturesDataSource {
  Future<
      ({
        List<DailyPictureModel>? dailyPictures,
        RemoteRequestResult? errorType
      })> getDailyPictures();
}

@Injectable(as: RemoteDailyPicturesDataSource)
class RemoteDailyPicturesDataSourceImpl
    implements RemoteDailyPicturesDataSource {
  final HttpClient _httpClient;
  final DefaultLogger _logger;

  RemoteDailyPicturesDataSourceImpl(this._httpClient, this._logger);

  @override
  Future<
      ({
        List<DailyPictureModel>? dailyPictures,
        RemoteRequestResult? errorType
      })> getDailyPictures() async {
    final apiUrl = dotenv.env['API_URL'];
    final apiKey = dotenv.env['API_KEY'];

    if (apiUrl == null || apiKey == '' || apiKey == null || apiKey == '') {
      return (
        dailyPictures: null,
        errorType: RemoteRequestResult.envDataNotDefined
      );
    }

    final url = '$apiUrl?api_key=$apiKey&count=10';

    try {
      final response = await _httpClient.get(url);

      if (response.statusCode == 200) {
        final body = response.data as List;

        final data = List<DailyPictureModel>.from(
            body.map((e) => DailyPictureModel.fromJson(e)).toList());

        return (dailyPictures: data, errorType: null);
      }

      return (
        dailyPictures: null,
        errorType: RemoteRequestResult.unableToRetrieveData
      );
    } on SocketException catch (e) {
      // Network error
      _logger.error('Network error: ${e.toString()}');
      return (dailyPictures: null, errorType: RemoteRequestResult.networkError);
    } on DioException catch (e) {
      // HTTP error
      _logger.error('HTTP error: ${e.toString()}');
      return (dailyPictures: null, errorType: RemoteRequestResult.httpError);
    } on FormatException catch (e) {
      // JSON format error
      _logger.error('JSON format error: ${e.toString()}');
      return (
        dailyPictures: null,
        errorType: RemoteRequestResult.jsonFormatError
      );
    } on TypeError catch (e) {
      // Type error
      _logger.error('Type error: ${e.toString()}');
      return (dailyPictures: null, errorType: RemoteRequestResult.typeError);
    } catch (e) {
      // Unable to retrieve data
      _logger.error('Unable to retrieve data: ${e.toString()}');
      return (
        dailyPictures: null,
        errorType: RemoteRequestResult.unableToRetrieveData
      );
    }
  }
}
