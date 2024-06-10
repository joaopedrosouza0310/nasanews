import 'package:injectable/injectable.dart';
import 'package:nasanews/src/features/daily_picture/daily_picture.dart';


@Injectable()
class GetLocalDailyPictures {
  final DailyPicturesRepository repository;

  GetLocalDailyPictures(this.repository);

  Future<({List<DailyPicture>? dailyPictures, String? errorMessage})> call() {
    return repository.getLocalDailyPictures();
  }
}
