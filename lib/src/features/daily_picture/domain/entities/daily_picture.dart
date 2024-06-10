import '../../data/data.dart';

enum MediaType { image, video }

class DailyPicture {
  final String title;
  final String explanation;
  final String imageUrl;
  final MediaType type;
  final DateTime date;
  final String? copyright;
  final String? imagePath;

  DailyPicture({
    required this.title,
    required this.explanation,
    required this.imageUrl,
    required this.type,
    required this.date,
    required this.copyright,
    this.imagePath,
  });

  DailyPictureModel toModel({String? imageBase64}) {
    return DailyPictureModel(
      title: title,
      explanation: explanation,
      imageUrl: imageBase64 ?? imageUrl,
      mediaType: type == MediaType.image ? 'image' : 'video',
      date: date.toIso8601String(),
      copyright: copyright,
      hdurl: imageUrl,
      imagePath: imagePath,
      serviceVersion: 'v1',
    );
  }

  @override
  String toString() {
    return 'DailyPicture(title: $title, explanation: $explanation, imageUrl: $imageUrl, type: $type, date: $date, copyright: $copyright)';
  }
}
