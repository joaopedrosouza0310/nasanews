import 'package:flutter/material.dart';
import 'package:internet_connectivity_checker/internet_connectivity_checker.dart';
import 'package:nasanews/src/core/core.dart';

import '../../daily_picture.dart';

class PicturesList extends StatelessWidget {
  final List<DailyPicture> dailyPictures;
  final ConnectivityStatus connectivityStatus;

  const PicturesList({
    super.key,
    required this.dailyPictures,
    required this.connectivityStatus,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: dailyPictures.length,
      itemBuilder: (context, index) {
        final length = dailyPictures.length;
        final dailyPicture = dailyPictures[index];

        if ((index + 1) == length &&
            connectivityStatus == ConnectivityStatus.online) {
          getIt<DailyPicturesCubit>().loadMore();
        }

        return PictureTile(dailyPicture);
      },
    );
  }
}
