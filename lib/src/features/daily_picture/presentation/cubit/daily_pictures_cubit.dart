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

    final value = await ((state.isConnected) ? remote() : local());

    final (:dailyPictures, :errorMessage) = value;

    emit(state.copyWith(
      isLoadingMore: false,
      dailyPictures: List<DailyPicture>.from(state.dailyPictures)
        ..addAll(dailyPictures ?? []),
      errorMessage: errorMessage,
    ));

    if (state.isConnected) saveDailyPicturesLocally();
  }

  Future<LocalRequestResult> saveDailyPicturesLocally() =>
      getIt<SaveDailyPictures>().call(state.dailyPictures);

  void setConnectivityStatus(bool isConnected) {
    if (isConnected && state.dailyPictures.isEmpty) loadMore();

    emit(state.copyWith(isConnected: isConnected));
  }
}
