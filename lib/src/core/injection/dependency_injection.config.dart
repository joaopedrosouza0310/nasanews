// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i3;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../../features/daily_picture/daily_picture.dart' as _i18;
import '../../features/daily_picture/data/data.dart' as _i16;
import '../../features/daily_picture/data/data_sources/local/local_daily_pictures_data_source.dart'
    as _i13;
import '../../features/daily_picture/data/data_sources/remote/remote_daily_pictures_data_source.dart'
    as _i12;
import '../../features/daily_picture/data/repositories/daily_pictures_repository.dart'
    as _i15;
import '../../features/daily_picture/domain/domain.dart' as _i14;
import '../../features/daily_picture/domain/use_cases/get_daily_pictures.dart'
    as _i20;
import '../../features/daily_picture/domain/use_cases/get_local_daily_pictures.dart'
    as _i17;
import '../../features/daily_picture/domain/use_cases/save_daily_pictures.dart'
    as _i19;
import '../../features/daily_picture/presentation/cubit/daily_pictures_cubit.dart'
    as _i6;
import '../core.dart' as _i11;
import '../http/http_client.dart' as _i7;
import '../storage/shared_preferences_service.dart' as _i9;
import '../utils/logger/default_logger.dart' as _i8;
import '../utils/utils_services.dart' as _i10;
import 'dependency_injection.dart' as _i21;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.Logger>(() => registerModule.logger);
    await gh.factoryAsync<_i4.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i5.Dio>(() => registerModule.dio);
    gh.singleton<_i6.DailyPicturesCubit>(() => _i6.DailyPicturesCubit());
    gh.factory<_i7.HttpClient>(() => _i7.DioHttpClient(gh<_i5.Dio>()));
    gh.factory<_i8.DefaultLogger>(
        () => _i8.DefaultLogger(logger: gh<_i3.Logger>()));
    gh.singleton<_i9.SharedPreferencesService>(
        () => _i9.SharedPreferencesServiceImpl(gh<_i4.SharedPreferences>()));
    gh.factory<_i10.UtilsServices>(
        () => _i10.UtilsServicesImpl(gh<_i11.DefaultLogger>()));
    gh.factory<_i12.RemoteDailyPicturesDataSource>(
        () => _i12.RemoteDailyPicturesDataSourceImpl(
              gh<_i11.HttpClient>(),
              gh<_i11.DefaultLogger>(),
            ));
    gh.factory<_i13.LocalDailyPicturesDataSource>(
        () => _i13.LocalDailyPicturesDataSourceImpl(
              gh<_i11.DefaultLogger>(),
              gh<_i11.SharedPreferencesService>(),
              gh<_i11.UtilsServices>(),
            ));
    gh.factory<_i14.DailyPicturesRepository>(
        () => _i15.DailyPicturesRepositoryImpl(
              gh<_i16.RemoteDailyPicturesDataSource>(),
              gh<_i16.LocalDailyPicturesDataSource>(),
            ));
    gh.factory<_i17.GetLocalDailyPictures>(
        () => _i17.GetLocalDailyPictures(gh<_i18.DailyPicturesRepository>()));
    gh.factory<_i19.SaveDailyPictures>(
        () => _i19.SaveDailyPictures(gh<_i14.DailyPicturesRepository>()));
    gh.factory<_i20.GetDailyPictures>(
        () => _i20.GetDailyPictures(gh<_i14.DailyPicturesRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i21.RegisterModule {}
