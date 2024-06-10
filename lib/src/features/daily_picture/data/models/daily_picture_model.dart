import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/domain.dart';

part 'daily_picture_model.freezed.dart';
part 'daily_picture_model.g.dart';

@freezed
class DailyPictureModel with _$DailyPictureModel {
  const DailyPictureModel._();

  const factory DailyPictureModel({
    required String? copyright,
    required String date,
    required String explanation,
    required String? hdurl,
    @JsonKey(name: 'media_type') required String mediaType,
    @JsonKey(name: 'service_version', defaultValue: '')
    required String serviceVersion,
    required String title,
    @JsonKey(name: 'url') required String imageUrl,
    String? imagePath,
  }) = _DailyPictureModel;

  factory DailyPictureModel.fromJson(Map<String, Object?> json) =>
      _$DailyPictureModelFromJson(json);

  DailyPicture toEntity() {
    return DailyPicture(
      title: title,
      explanation: explanation,
      imageUrl: imageUrl,
      type: mediaType == 'image' ? MediaType.image : MediaType.video,
      date: DateTime.parse(date),
      copyright: copyright,
      imagePath: imagePath,
    );
  }
}
