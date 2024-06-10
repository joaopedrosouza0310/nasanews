import 'package:flutter/material.dart';
import 'package:nasanews/src/core/core.dart';

import '../domain/domain.dart';
import 'widgets/widgets.dart';

class PictureDetails extends StatelessWidget {
  final DailyPicture picture;

  const PictureDetails(this.picture, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(picture.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Image
          Expanded(
            child: InteractiveViewer(
              child: PictureTileImage(
                picture.imageUrl,
                imagePath: picture.imagePath,
              ),
            ),
          ),

          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Copyright
                  if (picture.copyright != null) ...[
                    Text(
                      picture.copyright!.removeAllBreakLines(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),

                    // Spacing
                    MaterialSpacing.heightMin(),
                  ],

                  // Date
                  Text(
                    picture.date.formattedDate(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  // Spacing
                  MaterialSpacing.heightMin(),

                  // Explanation
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        picture.explanation,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
