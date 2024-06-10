import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasanews/src/features/daily_picture/daily_picture.dart';

import 'get_local_daily_pictures_test.mocks.dart';

@GenerateMocks([DailyPicturesRepository])
void main() {
  late MockDailyPicturesRepository mockRepository;
  late GetLocalDailyPictures useCase;

  setUp(() {
    mockRepository = MockDailyPicturesRepository();
    useCase = GetLocalDailyPictures(mockRepository);
  });

  group('GetLocalDailyPictures', () {
    test(
        'should return local daily pictures when the repository call is successful',
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
      when(mockRepository.getLocalDailyPictures()).thenAnswer(
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
      const errorMessage = 'Erro ao recuperar os dados';
      when(mockRepository.getLocalDailyPictures()).thenAnswer(
          (_) async => (dailyPictures: null, errorMessage: errorMessage));

      // Act
      final result = await useCase();

      // Assert
      expect(result.dailyPictures, isNull);
      expect(result.errorMessage, errorMessage);
    });
  });
}
