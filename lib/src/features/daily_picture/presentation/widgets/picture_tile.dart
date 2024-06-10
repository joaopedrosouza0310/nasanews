import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nasanews/src/core/core.dart';

import '../../domain/domain.dart';
import 'widgets.dart';

class PictureTile extends StatelessWidget {
  final DailyPicture dailyPicture;

  const PictureTile(
    this.dailyPicture, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          RoutesPath.pictureDetails.path,
          extra: dailyPicture,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            // image
            PictureTileImage(
              dailyPicture.imageUrl,
              imagePath: dailyPicture.imagePath,
              isSmallSize: true,
            ),

            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Title
                    Text(
                      dailyPicture.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 2,
                    ),

                    // Copyright
                    if (dailyPicture.copyright != null)
                      Text(
                        'By: ${dailyPicture.copyright!.removeAllBreakLines()}',
                        style: const TextStyle(fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                    // Date of the picture
                    Text(dailyPicture.date.formattedDate()),
                  ],
                ),
              ),
            ),

            // Arrow
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
