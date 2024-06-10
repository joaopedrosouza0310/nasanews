import 'package:injectable/injectable.dart';
import 'package:nasanews/src/features/daily_picture/domain/domain.dart';

import '../data.dart';

@Injectable(as: DailyPicturesRepository)
class DailyPicturesRepositoryImpl implements DailyPicturesRepository {
  final RemoteDailyPicturesDataSource _remoteDataSource;
  final LocalDailyPicturesDataSource _localDataSource;

  DailyPicturesRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<({List<DailyPicture>? dailyPictures, String? errorMessage})>
      getDailyPictures() async {
    final (:dailyPictures, :errorType) =
        await _remoteDataSource.getDailyPictures();

    if (errorType != null) {
      return (
        dailyPictures: null,
        errorMessage: _handleRemoteErrorMessage(errorType)
      );
    }

    return (
      dailyPictures: dailyPictures?.map((e) => e.toEntity()).toList(),
      errorMessage: null
    );
  }

  @override
  Future<({List<DailyPicture>? dailyPictures, String? errorMessage})>
      getLocalDailyPictures() async {
    final (:dailyPictures, :resultType) =
        await _localDataSource.getDailyPictures();

    if (resultType != LocalRequestResult.success) {
      return (
        dailyPictures: null,
        errorMessage: _handleLocalMessage(resultType)
      );
    }

    return (
      dailyPictures: dailyPictures?.map((e) => e.toEntity()).toList(),
      errorMessage: null
    );
  }

  @override
  Future<List<DailyPicture>> saveDailyPictures(
      List<DailyPicture> dailyPictures) async {
    final result = await _localDataSource
        .saveDailyPictures(dailyPictures.map((e) => e.toModel()).toList());

    return List<DailyPicture>.from(
        (result as List<DailyPictureModel>).map((e) => e.toEntity()).toList());
  }

  String _handleLocalMessage(LocalRequestResult result) {
    switch (result) {
      case LocalRequestResult.errorRetrieving:
        return 'Erro ao recuperar os dados';
      case LocalRequestResult.errorSaving:
        return 'Erro ao salvar os dados';
      case LocalRequestResult.success:
        return 'Sucesso';
    }
  }

  String _handleRemoteErrorMessage(RemoteRequestResult result) {
    switch (result) {
      case RemoteRequestResult.unableToRetrieveData:
        return 'Não foi possível recuperar os dados';
      case RemoteRequestResult.httpError:
        return 'Erro de requisição HTTP';
      case RemoteRequestResult.jsonFormatError:
        return 'Erro de formato JSON';
      case RemoteRequestResult.networkError:
        return 'Erro de rede';
      case RemoteRequestResult.typeError:
        return 'Erro de tipo';
      case RemoteRequestResult.envDataNotDefined:
        return 'Dados de ambiente não definidos';
    }
  }
}
