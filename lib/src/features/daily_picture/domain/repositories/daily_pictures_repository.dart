import 'package:nasanews/src/features/daily_picture/data/data_sources/local/local_daily_pictures_data_source.dart';
import 'package:nasanews/src/features/daily_picture/domain/domain.dart';

abstract interface class DailyPicturesRepository {
  Future<({List<DailyPicture>? dailyPictures, String? errorMessage})>
      getDailyPictures();

  Future<({List<DailyPicture>? dailyPictures, String? errorMessage})>
      getLocalDailyPictures();

  Future<LocalRequestResult> saveDailyPictures(
      List<DailyPicture> dailyPictures);
}
