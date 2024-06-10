import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity_checker/internet_connectivity_checker.dart';
import 'package:nasanews/src/core/core.dart';

import '../daily_picture.dart';

class PicturesPage extends StatefulWidget {
  const PicturesPage({super.key});

  @override
  State<PicturesPage> createState() => _PicturesPageState();
}

class _PicturesPageState extends State<PicturesPage> {
  late final DailyPicturesCubit dailyPicturesCubit;

  @override
  void initState() {
    super.initState();

    dailyPicturesCubit = getIt<DailyPicturesCubit>()..loadMore();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyPicturesCubit, DailyPicturesState>(
      bloc: dailyPicturesCubit,
      builder: (context, state) {
        final dailyPictures = state.dailyPictures;

        return ConnectivityBuilder(
          builder: (status) {
            dailyPicturesCubit
                .setConnectivityStatus(status == ConnectivityStatus.online);

            return Scaffold(
              body: Builder(builder: (context) {
                if (state.dailyPictures.isEmpty && state.isLoadingMore) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return SafeArea(
                  child: Column(
                    children: [
                      // Online reminder
                      OnlineReminder(status),

                      // Pictures
                      Expanded(
                        child: PicturesList(
                          dailyPictures: dailyPictures,
                          connectivityStatus: status,
                        ),
                      ),

                      // Loading
                      if (state.isLoadingMore && state.dailyPictures.isNotEmpty)
                        const LoadingMore(),
                    ],
                  ),
                );
              }),
            );
          },
        );
      },
    );
  }
}
