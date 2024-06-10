import 'package:injectable/injectable.dart';

import '../domain.dart';

@Injectable()
class SaveDailyPictures {
  final DailyPicturesRepository repository;

  SaveDailyPictures(this.repository);

  Future<List<DailyPicture>> call(List<DailyPicture> dailyPictures) {
    return repository.saveDailyPictures(dailyPictures);
  }
}
