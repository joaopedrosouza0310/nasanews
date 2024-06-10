import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasanews/src/features/daily_picture/domain/domain.dart'; 

import 'get_daily_pictures_test.mocks.dart';

@GenerateMocks([DailyPicturesRepository])
void main() {
  late MockDailyPicturesRepository mockRepository;
  late GetDailyPictures useCase;

  setUp(() {
    mockRepository = MockDailyPicturesRepository();
    useCase = GetDailyPictures(mockRepository);
  });

  group('GetDailyPictures', () {
    test('should return daily pictures when the repository call is successful',
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
      when(mockRepository.getDailyPictures()).thenAnswer(
          (_) async => (dailyPictures: testData, errorMessage: null));

      // Act
      final result = await useCase();

      // Assert
      expect(result.dailyPictures, testData);
      expect(result.errorMessage, isNull);
    });

    test('should return error message when the repository call fails',
        () async {
      // Arrange
      const errorMessage = 'Erro de rede';
      when(mockRepository.getDailyPictures()).thenAnswer(
          (_) async => (dailyPictures: null, errorMessage: errorMessage));

      // Act
      final result = await useCase();

      // Assert
      expect(result.dailyPictures, isNull);
      expect(result.errorMessage, errorMessage);
    });
  });
}
