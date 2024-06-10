import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasanews/src/features/daily_picture/data/data.dart';
import 'package:nasanews/src/features/daily_picture/domain/domain.dart';

import 'daily_pictures_repository_test.mocks.dart';

@GenerateMocks([RemoteDailyPicturesDataSource, LocalDailyPicturesDataSource])
void main() {
  late MockRemoteDailyPicturesDataSource mockRemoteDataSource;
  late MockLocalDailyPicturesDataSource mockLocalDataSource;
  late DailyPicturesRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = MockRemoteDailyPicturesDataSource();
    mockLocalDataSource = MockLocalDailyPicturesDataSource();
    repository =
        DailyPicturesRepositoryImpl(mockRemoteDataSource, mockLocalDataSource);
  });

  group('getDailyPictures', () {
    test(
        'should return dailyPictures when the remote data source is successful',
        () async {
      // Arrange
      final testData = [
        const DailyPictureModel(
          copyright: 'Copyright 1',
          date: '2022-01-01',
          explanation: 'Explanation 1',
          hdurl: 'hdurl1',
          mediaType: 'image',
          serviceVersion: 'v1',
          title: 'Picture 1',
          imageUrl: 'url1',
        ),
      ];
      when(mockRemoteDataSource.getDailyPictures())
          .thenAnswer((_) async => (dailyPictures: testData, errorType: null));

      // Act
      final result = await repository.getDailyPictures();

      // Assert
      final expectedEntities = testData.map((e) => e.toEntity()).toList();
      expect(result.dailyPictures?.length, expectedEntities.length);
      expect(result.errorMessage, isNull);
    });

    test('should return error message when the remote data source fails',
        () async {
      // Arrange
      when(mockRemoteDataSource.getDailyPictures()).thenAnswer((_) async =>
          (dailyPictures: null, errorType: RemoteRequestResult.networkError));

      // Act
      final result = await repository.getDailyPictures();

      // Assert
      expect(result.dailyPictures, isNull);
      expect(result.errorMessage, 'Erro de rede');
    });
  });

  group('getLocalDailyPictures', () {
    test('should return dailyPictures when the local data source is successful',
        () async {
      // Arrange
      final testData = [
        const DailyPictureModel(
          copyright: 'Copyright 1',
          date: '2022-01-01',
          explanation: 'Explanation 1',
          hdurl: 'hdurl1',
          mediaType: 'image',
          serviceVersion: 'v1',
          title: 'Picture 1',
          imageUrl: 'url1',
        ),
      ];
      when(mockLocalDataSource.getDailyPictures()).thenAnswer((_) async =>
          (dailyPictures: testData, resultType: LocalRequestResult.success));

      // Act
      final result = await repository.getLocalDailyPictures();

      // Assert
      final expectedEntities = testData.map((e) => e.toEntity()).toList();
      expect(result.dailyPictures?.length, expectedEntities.length);
      expect(result.errorMessage, isNull);
    });

    test('should return error message when the local data source fails',
        () async {
      // Arrange
      when(mockLocalDataSource.getDailyPictures()).thenAnswer((_) async => (
            dailyPictures: null,
            resultType: LocalRequestResult.errorRetrieving
          ));

      // Act
      final result = await repository.getLocalDailyPictures();

      // Assert
      expect(result.dailyPictures, isNull);
      expect(result.errorMessage, 'Erro ao recuperar os dados');
    });
  });

  group('saveDailyPictures', () {
    test(
        'should return success when the local data source saves data successfully',
        () async {
      // Arrange
      final testData = [
        DailyPicture(
          title: 'Picture 1',
          explanation: 'Explanation 1',
          imageUrl: 'url1',
          type: MediaType.image,
          date: DateTime.parse('2022-01-01'),
          copyright: 'Copyright 1',
        ),
      ];
      when(mockLocalDataSource.saveDailyPictures(any))
          .thenAnswer((_) async => LocalRequestResult.success);

      // Act
      final result = await repository.saveDailyPictures(testData);

      // Assert
      expect(result, LocalRequestResult.success);
    });

    test('should return error when the local data source fails to save data',
        () async {
      // Arrange
      final testData = [
        DailyPicture(
          title: 'Picture 1',
          explanation: 'Explanation 1',
          imageUrl: 'url1',
          type: MediaType.image,
          date: DateTime.parse('2022-01-01'),
          copyright: 'Copyright 1',
        ),
      ];
      when(mockLocalDataSource.saveDailyPictures(any))
          .thenAnswer((_) async => LocalRequestResult.errorSaving);

      // Act
      final result = await repository.saveDailyPictures(testData);

      // Assert
      expect(result, LocalRequestResult.errorSaving);
    });
  });
}
