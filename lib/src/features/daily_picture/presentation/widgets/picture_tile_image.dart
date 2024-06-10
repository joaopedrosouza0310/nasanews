import 'dart:io';

import 'package:flutter/material.dart';
import 'package:internet_connectivity_checker/internet_connectivity_checker.dart';
import 'package:nasanews/src/core/extensions/string_extensions.dart';

class PictureTileImage extends StatefulWidget {
  final String imageUrl;
  final String? imagePath;
  final bool isSmallSize;

  const PictureTileImage(
    this.imageUrl, {
   required this.imagePath,
    this.isSmallSize = false,
    super.key,
  });

  @override
  State<PictureTileImage> createState() => _PictureTileImageState();
}

class _PictureTileImageState extends State<PictureTileImage> {
  @override
  Widget build(BuildContext context) {
    return ConnectivityBuilder(
      builder: (status) {
        final isOnline = status == ConnectivityStatus.online;

        const imageError = SizedBox.square(
          dimension: 100,
          child: Icon(Icons.image_not_supported),
        );

        late final Image image;

        if (widget.imageUrl.isUrl() && isOnline) {
          image = Image.network(
            widget.imageUrl,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return imageError;
            },
          );
        } else {
          if (widget.imagePath == null) return imageError;

          image = Image.file(
            File(widget.imagePath!),
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return imageError;
            },
          );
        }

        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox.square(
            dimension: widget.isSmallSize ? 100 : null,
            child: image,
          ),
        );
      },
    );
  }
}
