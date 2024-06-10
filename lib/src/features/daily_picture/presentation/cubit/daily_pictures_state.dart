import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nasanews/src/features/daily_picture/daily_picture.dart';

part 'daily_pictures_state.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DailyPicturesState with _$DailyPicturesState {
  const DailyPicturesState._();

  const factory DailyPicturesState({
    required bool isLoadingMore,
    required List<DailyPicture> dailyPictures,
    required String? errorMessage,
    required bool isConnected,
  }) = _DailyPicturesState;

  factory DailyPicturesState.initial() => const DailyPicturesState(
        dailyPictures: [],
        isLoadingMore: true,
        errorMessage: null,
        isConnected: false,
      );
}
