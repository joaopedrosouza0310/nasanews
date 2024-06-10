import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasanews/src/core/core.dart';
import 'package:nasanews/src/features/daily_picture/data/data.dart';

import 'remote_daily_pictures_data_source_test.mocks.dart';

// Gera os mocks necessários
@GenerateMocks([HttpClient, DefaultLogger])
void main() {
  late MockHttpClient mockHttpClient;
  late MockDefaultLogger mockLogger;
  late RemoteDailyPicturesDataSourceImpl dataSource;

  setUp(() async {
    mockHttpClient = MockHttpClient();
    mockLogger = MockDefaultLogger();
    dataSource = RemoteDailyPicturesDataSourceImpl(mockHttpClient, mockLogger);
    await dotenv
        .load(); // Carrega o arquivo .env para obter as variáveis de ambiente
  });

  group('getDailyPictures', () {
    test(
        'should return dailyPictures and no error when data is retrieved successfully',
        () async {
      // Arrange
      final testData = [
        {
          "copyright": "Copyright 1",
          "date": "2022-01-01",
          "explanation": "Explanation 1",
          "hdurl": "hdurl1",
          "media_type": "image",
          "service_version": "v1",
          "title": "Picture 1",
          "url": "url1"
        },
        {
          "copyright": "Copyright 2",
          "date": "2022-01-02",
          "explanation": "Explanation 2",
          "hdurl": "hdurl2",
          "media_type": "image",
          "service_version": "v1",
          "title": "Picture 2",
          "url": "url2"
        },
      ];
      when(mockHttpClient.get(any)).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 200,
          data: testData));

      // Act
      final result = await dataSource.getDailyPictures();

      // Assert
      expect(result.errorType, isNull);
      expect(result.dailyPictures, isNotNull);
      expect(result.dailyPictures?.length, testData.length);
    });

    test(
        'should return envDataNotDefined when API_URL or API_KEY is not defined',
        () async {
      // Arrange
      // Remove API_URL and API_KEY from dotenv
      dotenv.env['API_URL'] = '';
      dotenv.env['API_KEY'] = '';

      // Act
      final result = await dataSource.getDailyPictures();

      // Assert
      expect(result.errorType, RemoteRequestResult.envDataNotDefined);
      expect(result.dailyPictures, isNull);
    });

    test('should return networkError on SocketException', () async {
      // Arrange
      when(mockHttpClient.get(any))
          .thenThrow(const SocketException('Network error'));

      // Act
      final result = await dataSource.getDailyPictures();

      // Assert
      expect(result.errorType, RemoteRequestResult.networkError);
      expect(result.dailyPictures, isNull);
      verify(mockLogger.error(any)).called(1);
    });

    test('should return httpError on DioException', () async {
      // Arrange
      when(mockHttpClient.get(any)).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
      ));

      // Act
      final result = await dataSource.getDailyPictures();

      // Assert
      expect(result.errorType, RemoteRequestResult.httpError);
      expect(result.dailyPictures, isNull);
      verify(mockLogger.error(any)).called(1);
    });

    test('should return jsonFormatError on FormatException', () async {
      // Arrange
      when(mockHttpClient.get(any))
          .thenThrow(const FormatException('JSON error'));

      // Act
      final result = await dataSource.getDailyPictures();

      // Assert
      expect(result.errorType, RemoteRequestResult.jsonFormatError);
      expect(result.dailyPictures, isNull);
      verify(mockLogger.error(any)).called(1);
    });

    test('should return typeError on TypeError', () async {
      // Arrange
      when(mockHttpClient.get(any)).thenThrow(TypeError());

      // Act
      final result = await dataSource.getDailyPictures();

      // Assert
      expect(result.errorType, RemoteRequestResult.typeError);
      expect(result.dailyPictures, isNull);
      verify(mockLogger.error(any)).called(1);
    });

    test('should return unableToRetrieveData on general exception', () async {
      // Arrange
      when(mockHttpClient.get(any)).thenThrow(Exception('General error'));

      // Act
      final result = await dataSource.getDailyPictures();

      // Assert
      expect(result.errorType, RemoteRequestResult.unableToRetrieveData);
      expect(result.dailyPictures, isNull);
      verify(mockLogger.error(any)).called(1);
    });
  });
}
