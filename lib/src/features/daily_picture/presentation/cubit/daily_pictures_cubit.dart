import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:nasanews/src/core/core.dart';

import '../../daily_picture.dart';

@Singleton()
class DailyPicturesCubit extends Cubit<DailyPicturesState> {
  DailyPicturesCubit() : super(DailyPicturesState.initial());

  Future<void> loadMore() async {
    emit(state.copyWith(isLoadingMore: true));

    final remote = getIt<GetDailyPictures>();
    final local = getIt<GetLocalDailyPictures>();

    late final ({
      List<DailyPicture>? dailyPictures,
      String? errorMessage
    }) value;

    if (state.isConnected) {
      value = await remote.call();
    } else {
      value = await local.call();
    }

    final (:dailyPictures, :errorMessage) = value;

    emit(state.copyWith(
      isLoadingMore: false,
      dailyPictures: List<DailyPicture>.from(state.dailyPictures)
        ..addAll(dailyPictures ?? []),
      errorMessage: errorMessage,
    ));

    if (state.isConnected) {
      final savedData = await saveDailyPicturesLocally();
      _mergePictures(savedData);
    }
  }

  void _mergePictures(List<DailyPicture>? savedData) {
    if (savedData == null) return;

    final stateDataCopy = List<DailyPicture>.from(state.dailyPictures);
    for (var pic in savedData) {
      final index = stateDataCopy.indexWhere((p) => p.title == pic.title);

      if (index < 0) continue;

      stateDataCopy[index] = pic;
    }
    emit(state.copyWith(
      dailyPictures: stateDataCopy,
    ));
  }

  Future<List<DailyPicture>> saveDailyPicturesLocally() =>
      getIt<SaveDailyPictures>().call(state.dailyPictures);

  void setConnectivityStatus(bool isConnected) {
    if (isConnected && state.dailyPictures.isEmpty) loadMore();

    emit(state.copyWith(isConnected: isConnected));
  }
}
