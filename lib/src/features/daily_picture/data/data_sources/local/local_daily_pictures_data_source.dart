import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:nasanews/src/features/daily_picture/data/data.dart';

import '../../../../../core/core.dart';

enum LocalRequestResult {
  errorRetrieving,
  errorSaving,
  success,
}

abstract interface class LocalDailyPicturesDataSource {
  Future<
      ({
        List<DailyPictureModel>? dailyPictures,
        LocalRequestResult resultType
      })> getDailyPictures();

  Future<List<DailyPictureModel>?> saveDailyPictures(
      List<DailyPictureModel> dailyPictures);

  Future<LocalRequestResult> saveSinglePicture(DailyPictureModel picture);
}

@Injectable(as: LocalDailyPicturesDataSource)
class LocalDailyPicturesDataSourceImpl implements LocalDailyPicturesDataSource {
  final DefaultLogger _logger;
  final SharedPreferencesService _sharedPreferencesService;
  final UtilsServices _utilsServices;

  LocalDailyPicturesDataSourceImpl(
    this._logger,
    this._sharedPreferencesService,
    this._utilsServices,
  );

  @override
  Future<
      ({
        List<DailyPictureModel>? dailyPictures,
        LocalRequestResult resultType
      })> getDailyPictures() async {
    try {
      List<DailyPictureModel> dailyPictures = [];

      final jsonData = _sharedPreferencesService
          .getString(SharedPreferencesKeys.dailyPictures);

      if (jsonData != null) {
        final localData = json.decode(jsonData) as List;

        dailyPictures = List<DailyPictureModel>.from(
            localData.map((e) => DailyPictureModel.fromJson(e)).toList());
      }

      return (
        dailyPictures: dailyPictures,
        resultType: LocalRequestResult.success
      );
    } catch (e) {
      // Unable to retrieve data
      _logger.error('Unable to retrieve data: ${e.toString()}');
      return (
        dailyPictures: null,
        resultType: LocalRequestResult.errorRetrieving
      );
    }
  }

  @override
  Future<LocalRequestResult> saveSinglePicture(
      DailyPictureModel picture) async {
    try {
      final fileImage = await _utilsServices.downloadImage(picture.imageUrl);

      List<DailyPictureModel> dailyPictures = [];

      final localPicturesJson = _sharedPreferencesService.getString(
        SharedPreferencesKeys.dailyPictures,
      );

      if (localPicturesJson != null) {
        final localData = json.decode(localPicturesJson) as List;

        dailyPictures = List<DailyPictureModel>.from(
            localData.map((e) => DailyPictureModel.fromJson(e)).toList());
      }

      final index = dailyPictures.indexWhere((p) => p.title == picture.title);
      final newPic = picture.copyWith(imagePath: fileImage?.path);

      if (index < 0) {
        dailyPictures.add(newPic);
      } else {
        dailyPictures[index] = newPic;
      }

      await _sharedPreferencesService.saveString(
        SharedPreferencesKeys.dailyPictures,
        json.encode(dailyPictures),
      );

      return LocalRequestResult.success;
    } catch (e) {
      // Unable to save data
      _logger.error('Unable to save data: ${e.toString()}');
      return LocalRequestResult.errorSaving;
    }
  }

  @override
  Future<List<DailyPictureModel>?> saveDailyPictures(
      List<DailyPictureModel> dailyPictures) async {
    try {
      for (var picture in dailyPictures) {
        await Future.delayed(const Duration(milliseconds: 500));

        saveSinglePicture(picture);
      }

      final result = await getDailyPictures();

      if (result.dailyPictures != null) return result.dailyPictures;

      return [];
    } catch (e) {
      // Unable to save data
      _logger.error('Unable to save data: ${e.toString()}');
      return [];
    }
  }
}
