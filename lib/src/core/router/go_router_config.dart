import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nasanews/src/features/daily_picture/daily_picture.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: RoutesPath.pictures.path,
      builder: (BuildContext context, GoRouterState state) {
        return const PicturesPage();
      },
    ),
    GoRoute(
      path: RoutesPath.pictureDetails.path,
      builder: (BuildContext context, GoRouterState state) {
        final picture = state.extra as DailyPicture;

        return PictureDetails(picture);
      },
    ),
  ],
);

enum RoutesPath {
  pictures('/'),
  pictureDetails('/picture_details');

  final String routePath;

  const RoutesPath(this.routePath);

  static RoutesPath? fromPath(String path) {
    for (var route in RoutesPath.values) {
      if (route.path == path) {
        return route;
      }
    }
    return null;
  }

  String get path => routePath;
}
