// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_picture_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyPictureModelImpl _$$DailyPictureModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyPictureModelImpl(
      copyright: json['copyright'] as String?,
      date: json['date'] as String,
      explanation: json['explanation'] as String,
      hdurl: json['hdurl'] as String?,
      mediaType: json['media_type'] as String,
      serviceVersion: json['service_version'] as String? ?? '',
      title: json['title'] as String,
      imageUrl: json['url'] as String,
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$$DailyPictureModelImplToJson(
        _$DailyPictureModelImpl instance) =>
    <String, dynamic>{
      'copyright': instance.copyright,
      'date': instance.date,
      'explanation': instance.explanation,
      'hdurl': instance.hdurl,
      'media_type': instance.mediaType,
      'service_version': instance.serviceVersion,
      'title': instance.title,
      'url': instance.imageUrl,
      'imagePath': instance.imagePath,
    };
