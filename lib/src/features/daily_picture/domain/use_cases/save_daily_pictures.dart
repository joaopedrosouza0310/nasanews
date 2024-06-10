import 'package:injectable/injectable.dart';

import '../../data/data.dart';
import '../domain.dart';

@Injectable()
class SaveDailyPictures {
  final DailyPicturesRepository repository;

  SaveDailyPictures(this.repository);

  Future<LocalRequestResult> call(List<DailyPicture> dailyPictures) {
    return repository.saveDailyPictures(dailyPictures);
  }
}
