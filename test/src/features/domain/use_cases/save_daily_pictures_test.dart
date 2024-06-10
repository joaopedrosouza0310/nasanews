import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasanews/src/features/daily_picture/data/data.dart';
import 'package:nasanews/src/features/daily_picture/domain/domain.dart';

import 'save_daily_pictures_test.mocks.dart';

@GenerateMocks([DailyPicturesRepository])
void main() {
  late MockDailyPicturesRepository mockRepository;
  late SaveDailyPictures useCase;

  setUp(() {
    mockRepository = MockDailyPicturesRepository();
    useCase = SaveDailyPictures(mockRepository);
  });

  group('SaveDailyPictures', () {
    final testPictures = [
      DailyPicture(
        title: 'Picture 1',
        explanation: 'Explanation 1',
        imageUrl: 'url1',
        type: MediaType.image,
        date: DateTime.parse('2022-01-01'),
        copyright: 'Copyright 1',
      ),
      DailyPicture(
        title: 'Picture 2',
        explanation: 'Explanation 2',
        imageUrl: 'url2',
        type: MediaType.image,
        date: DateTime.parse('2022-02-01'),
        copyright: 'Copyright 2',
      ),
    ];

    test('should return success when saving daily pictures is successful',
        () async {
      // Arrange
      when(mockRepository.saveDailyPictures(any))
          .thenAnswer((_) async => LocalRequestResult.success);

      // Act
      final result = await useCase(testPictures);

      // Assert
      expect(result, LocalRequestResult.success);
      verify(mockRepository.saveDailyPictures(testPictures)).called(1);
    });

    test('should return errorSaving when saving daily pictures fails',
        () async {
      // Arrange
      when(mockRepository.saveDailyPictures(any))
          .thenAnswer((_) async => LocalRequestResult.errorSaving);

      // Act
      final result = await useCase(testPictures);

      // Assert
      expect(result, LocalRequestResult.errorSaving);
      verify(mockRepository.saveDailyPictures(testPictures)).called(1);
    });
  });
}
