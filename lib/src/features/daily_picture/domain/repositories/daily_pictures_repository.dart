import 'package:nasanews/src/features/daily_picture/domain/domain.dart';

abstract interface class DailyPicturesRepository {
  Future<({List<DailyPicture>? dailyPictures, String? errorMessage})>
      getDailyPictures();

  Future<({List<DailyPicture>? dailyPictures, String? errorMessage})>
      getLocalDailyPictures();

  Future<List<DailyPicture>> saveDailyPictures(
      List<DailyPicture> dailyPictures);
}
