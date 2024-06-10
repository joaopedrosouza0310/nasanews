import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasanews/src/core/core.dart';
import 'package:nasanews/src/features/daily_picture/data/data.dart';

import 'daily_pictures_repository_test.mocks.dart';

@GenerateMocks([HttpClient, DefaultLogger])
void main() {
  late MockHttpClient mockHttpClient;
  late MockDefaultLogger mockLogger;
  late RemoteDailyPicturesDataSourceImpl dataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    mockLogger = MockDefaultLogger();
    dataSource = RemoteDailyPicturesDataSourceImpl(mockHttpClient, mockLogger);
  });

  group('getDailyPictures', () {
    const apiUrl = 'https://api.nasa.gov/planetary/apod';
    const apiKey = 'DEMO_KEY';

    setUp(() {
      dotenv.testLoad(fileInput: '''
      API_URL=$apiUrl
      API_KEY=$apiKey
      ''');
    });

    test(
        'should return list of daily pictures when the call to API is successful',
        () async {
      // Arrange
      final responseData = [
        {
          'title': 'Title 1',
          'explanation': 'Explanation 1',
          'url': 'url1',
          'media_type': 'image',
          'date': '2022-01-01',
          'copyright': 'Copyright 1',
          'hdurl': 'hdurl1',
          'service_version': 'v1',
          'imagePath': 'path1',
        },
      ];

      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => Response(
          data: responseData,
          statusCode: 200,
          requestOptions: RequestOptions(path: apiUrl),
        ),
      );

      // Act
      final result = await dataSource.getDailyPictures();

      // Assert
      expect(result.dailyPictures, isNotNull);
      expect(result.dailyPictures?.length, responseData.length);
      expect(result.errorType, isNull);
    });

    test('should return error when API URL or API key is not defined',
        () async {
      // Arrange
      dotenv.testLoad(fileInput: '''
      API_URL=
      API_KEY=
      ''');

      // Act
      final result = await dataSource.getDailyPictures();

      // Assert
      expect(result.dailyPictures, isNull);
      expect(result.errorType, RemoteRequestResult.envDataNotDefined);
    });

    test('should return network error on SocketException', () async {
      // Arrange
      when(mockHttpClient.get(any))
          .thenThrow(const SocketException('Network error'));

      // Act
      final result = await dataSource.getDailyPictures();

      // Assert
      expect(result.dailyPictures, isNull);
      expect(result.errorType, RemoteRequestResult.networkError);
      verify(mockLogger.error(any)).called(1);
    });

    test('should return http error on DioException', () async {
      // Arrange
      when(mockHttpClient.get(any)).thenThrow(DioException(
        requestOptions: RequestOptions(path: apiUrl),
        type: DioExceptionType.badResponse,
      ));

      // Act
      final result = await dataSource.getDailyPictures();

      // Assert
      expect(result.dailyPictures, isNull);
      expect(result.errorType, RemoteRequestResult.httpError);
      verify(mockLogger.error(any)).called(1);
    });

    test('should return json format error on FormatException', () async {
      // Arrange
      when(mockHttpClient.get(any))
          .thenThrow(const FormatException('JSON format error'));

      // Act
      final result = await dataSource.getDailyPictures();

      // Assert
      expect(result.dailyPictures, isNull);
      expect(result.errorType, RemoteRequestResult.jsonFormatError);
      verify(mockLogger.error(any)).called(1);
    });

    test('should return type error on TypeError', () async {
      // Arrange
      when(mockHttpClient.get(any)).thenThrow(TypeError());

      // Act
      final result = await dataSource.getDailyPictures();

      // Assert
      expect(result.dailyPictures, isNull);
      expect(result.errorType, RemoteRequestResult.typeError);
      verify(mockLogger.error(any)).called(1);
    });

    test('should return unableToRetrieveData on any other exception', () async {
      // Arrange
      when(mockHttpClient.get(any)).thenThrow(Exception('Unknown error'));

      // Act
      final result = await dataSource.getDailyPictures();

      // Assert
      expect(result.dailyPictures, isNull);
      expect(result.errorType, RemoteRequestResult.unableToRetrieveData);
      verify(mockLogger.error(any)).called(1);
    });
  });
}
