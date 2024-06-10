import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasanews/src/core/core.dart';
import 'package:nasanews/src/features/daily_picture/data/data.dart';

import 'local_daily_pictures_data_source_test.mocks.dart';

@GenerateMocks([DefaultLogger, SharedPreferencesService, UtilsServices])
void main() {
  late MockDefaultLogger mockLogger;
  late MockSharedPreferencesService mockSharedPreferencesService;
  late MockUtilsServices mockUtilsServices;
  late LocalDailyPicturesDataSourceImpl dataSource;

  setUp(() {
    mockLogger = MockDefaultLogger();
    mockSharedPreferencesService = MockSharedPreferencesService();
    mockUtilsServices = MockUtilsServices();
    dataSource = LocalDailyPicturesDataSourceImpl(
      mockLogger,
      mockSharedPreferencesService,
      mockUtilsServices,
    );
  });

  group('getDailyPictures', () {
    test('should return list of daily pictures when data is available',
        () async {
      // Arrange
      final testData = [
        const DailyPictureModel(
          title: 'Title 1',
          explanation: 'Explanation 1',
          imageUrl: 'url1',
          mediaType: 'image',
          date: '2022-01-01',
          copyright: 'Copyright 1',
          hdurl: 'hdurl1',
          serviceVersion: 'v1',
          imagePath: 'path1',
        ),
      ];
      when(mockSharedPreferencesService
              .getString(SharedPreferencesKeys.dailyPictures))
          .thenReturn(json.encode(testData));

      // Act
      final result = await dataSource.getDailyPictures();

      // Assert
      expect(result.dailyPictures, isNotNull);
      expect(result.dailyPictures?.length, testData.length);
      expect(result.resultType, LocalRequestResult.success);
    });

    test('should return error when unable to retrieve data', () async {
      // Arrange
      when(mockSharedPreferencesService
              .getString(SharedPreferencesKeys.dailyPictures))
          .thenThrow(Exception('Error'));

      // Act
      final result = await dataSource.getDailyPictures();

      // Assert
      expect(result.dailyPictures, isNull);
      expect(result.resultType, LocalRequestResult.errorRetrieving);
      verify(mockLogger.error(any)).called(1);
    });
  });

  group('saveDailyPictures', () {
    test('should return list of saved daily pictures when successful',
        () async {
      // Arrange
      final testData = [
        const DailyPictureModel(
          title: 'Title 1',
          explanation: 'Explanation 1',
          imageUrl: 'url1',
          mediaType: 'image',
          date: '2022-01-01',
          copyright: 'Copyright 1',
          hdurl: 'hdurl1',
          serviceVersion: 'v1',
          imagePath: 'path1',
        ),
      ];
      when(mockUtilsServices.downloadImage(any))
          .thenAnswer((_) async => null); // Mock downloadImage to return null
      when(mockSharedPreferencesService
              .getString(SharedPreferencesKeys.dailyPictures))
          .thenReturn(json.encode(testData));
      when(mockSharedPreferencesService.saveString(any, any))
          .thenAnswer((_) async => true);

      // Act
      final result = await dataSource.saveDailyPictures(testData);

      // Assert
      expect(result, isNotNull);
      expect(result?.length, testData.length);
    });
  });

  group('saveSinglePicture', () {
    test('should return success when saving a single picture is successful',
        () async {
      // Arrange
      const testPicture = DailyPictureModel(
        title: 'Title 1',
        explanation: 'Explanation 1',
        imageUrl: 'url1',
        mediaType: 'image',
        date: '2022-01-01',
        copyright: 'Copyright 1',
        hdurl: 'hdurl1',
        serviceVersion: 'v1',
        imagePath: 'path1',
      );
      when(mockUtilsServices.downloadImage(any))
          .thenAnswer((_) async => null); // Mock downloadImage to return null
      when(mockSharedPreferencesService
              .getString(SharedPreferencesKeys.dailyPictures))
          .thenReturn(json.encode([testPicture]));
      when(mockSharedPreferencesService.saveString(any, any))
          .thenAnswer((_) async => true);

      // Act
      final result = await dataSource.saveSinglePicture(testPicture);

      // Assert
      expect(result, LocalRequestResult.success);
    });

    test(
        'should return errorSaving when an error occurs during saving a single picture',
        () async {
      // Arrange
      const testPicture = DailyPictureModel(
        title: 'Title 1',
        explanation: 'Explanation 1',
        imageUrl: 'url1',
        mediaType: 'image',
        date: '2022-01-01',
        copyright: 'Copyright 1',
        hdurl: 'hdurl1',
        serviceVersion: 'v1',
        imagePath: 'path1',
      );
      when(mockUtilsServices.downloadImage(any)).thenThrow(Exception('Error'));

      // Act
      final result = await dataSource.saveSinglePicture(testPicture);

      // Assert
      expect(result, LocalRequestResult.errorSaving);
      verify(mockLogger.error(any)).called(1);
    });
  });
}
