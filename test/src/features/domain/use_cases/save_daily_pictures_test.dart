import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasanews/src/features/daily_picture/domain/domain.dart'; 

import 'save_daily_pictures_test.mocks.dart';

@GenerateMocks([DailyPicturesRepository])
void main() {
  late SaveDailyPictures useCase;
  late MockDailyPicturesRepository mockRepository;

  setUp(() {
    mockRepository = MockDailyPicturesRepository();
    useCase = SaveDailyPictures(mockRepository);
  });

  group('SaveDailyPictures', () {
    final tDailyPictures = [
      DailyPicture(
        title: 'Title 1',
        explanation: 'Explanation 1',
        imageUrl: 'url1',
        type: MediaType.image,
        date: DateTime.parse('2022-01-01'),
        copyright: 'Copyright 1',
      ),
      DailyPicture(
        title: 'Title 2',
        explanation: 'Explanation 2',
        imageUrl: 'url2',
        type: MediaType.image,
        date: DateTime.parse('2022-01-02'),
        copyright: 'Copyright 2',
      ),
    ];

    test('should save daily pictures and return saved pictures', () async {
      // Arrange
      when(mockRepository.saveDailyPictures(any))
          .thenAnswer((_) async => tDailyPictures);

      // Act
      final result = await useCase(tDailyPictures);

      // Assert
      expect(result, tDailyPictures);
      verify(mockRepository.saveDailyPictures(tDailyPictures)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle errors when saving daily pictures', () async {
      // Arrange
      when(mockRepository.saveDailyPictures(any))
          .thenThrow(Exception('Error saving pictures'));

      // Act
      try {
        await useCase(tDailyPictures);
      } catch (e) {
        expect(e, isA<Exception>());
        expect(e.toString(), equals('Exception: Error saving pictures'));
      }

      // Assert
      verify(mockRepository.saveDailyPictures(tDailyPictures)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
