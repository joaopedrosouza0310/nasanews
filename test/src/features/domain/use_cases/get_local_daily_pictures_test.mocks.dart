// Mocks generated by Mockito 5.4.4 from annotations
// in nasanews/test/src/features/domain/use_cases/get_local_daily_pictures_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:nasanews/src/features/daily_picture/data/data_sources/local/local_daily_pictures_data_source.dart'
    as _i4;
import 'package:nasanews/src/features/daily_picture/domain/domain.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [DailyPicturesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockDailyPicturesRepository extends _i1.Mock
    implements _i2.DailyPicturesRepository {
  MockDailyPicturesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<({List<_i2.DailyPicture>? dailyPictures, String? errorMessage})>
      getDailyPictures() => (super.noSuchMethod(
            Invocation.method(
              #getDailyPictures,
              [],
            ),
            returnValue: _i3.Future<
                ({
                  List<_i2.DailyPicture>? dailyPictures,
                  String? errorMessage
                })>.value((dailyPictures: null, errorMessage: null)),
          ) as _i3.Future<
              ({List<_i2.DailyPicture>? dailyPictures, String? errorMessage})>);

  @override
  _i3.Future<({List<_i2.DailyPicture>? dailyPictures, String? errorMessage})>
      getLocalDailyPictures() => (super.noSuchMethod(
            Invocation.method(
              #getLocalDailyPictures,
              [],
            ),
            returnValue: _i3.Future<
                ({
                  List<_i2.DailyPicture>? dailyPictures,
                  String? errorMessage
                })>.value((dailyPictures: null, errorMessage: null)),
          ) as _i3.Future<
              ({List<_i2.DailyPicture>? dailyPictures, String? errorMessage})>);

  @override
  _i3.Future<_i4.LocalRequestResult> saveDailyPictures(
          List<_i2.DailyPicture>? dailyPictures) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveDailyPictures,
          [dailyPictures],
        ),
        returnValue: _i3.Future<_i4.LocalRequestResult>.value(
            _i4.LocalRequestResult.errorRetrieving),
      ) as _i3.Future<_i4.LocalRequestResult>);
}
