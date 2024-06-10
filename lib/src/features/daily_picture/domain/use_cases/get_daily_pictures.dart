import 'package:injectable/injectable.dart';

import '../domain.dart';

@Injectable()
class GetDailyPictures {
  final DailyPicturesRepository repository;

  GetDailyPictures(this.repository);

  Future<({List<DailyPicture>? dailyPictures, String? errorMessage})> call() {
    return repository.getDailyPictures();
  }
}
