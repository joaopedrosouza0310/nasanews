// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_pictures_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DailyPicturesState {
  bool get isLoadingMore => throw _privateConstructorUsedError;
  List<DailyPicture> get dailyPictures => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get isConnected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DailyPicturesStateCopyWith<DailyPicturesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyPicturesStateCopyWith<$Res> {
  factory $DailyPicturesStateCopyWith(
          DailyPicturesState value, $Res Function(DailyPicturesState) then) =
      _$DailyPicturesStateCopyWithImpl<$Res, DailyPicturesState>;
  @useResult
  $Res call(
      {bool isLoadingMore,
      List<DailyPicture> dailyPictures,
      String? errorMessage,
      bool isConnected});
}

/// @nodoc
class _$DailyPicturesStateCopyWithImpl<$Res, $Val extends DailyPicturesState>
    implements $DailyPicturesStateCopyWith<$Res> {
  _$DailyPicturesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingMore = null,
    Object? dailyPictures = null,
    Object? errorMessage = freezed,
    Object? isConnected = null,
  }) {
    return _then(_value.copyWith(
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      dailyPictures: null == dailyPictures
          ? _value.dailyPictures
          : dailyPictures // ignore: cast_nullable_to_non_nullable
              as List<DailyPicture>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyPicturesStateImplCopyWith<$Res>
    implements $DailyPicturesStateCopyWith<$Res> {
  factory _$$DailyPicturesStateImplCopyWith(_$DailyPicturesStateImpl value,
          $Res Function(_$DailyPicturesStateImpl) then) =
      __$$DailyPicturesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoadingMore,
      List<DailyPicture> dailyPictures,
      String? errorMessage,
      bool isConnected});
}

/// @nodoc
class __$$DailyPicturesStateImplCopyWithImpl<$Res>
    extends _$DailyPicturesStateCopyWithImpl<$Res, _$DailyPicturesStateImpl>
    implements _$$DailyPicturesStateImplCopyWith<$Res> {
  __$$DailyPicturesStateImplCopyWithImpl(_$DailyPicturesStateImpl _value,
      $Res Function(_$DailyPicturesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingMore = null,
    Object? dailyPictures = null,
    Object? errorMessage = freezed,
    Object? isConnected = null,
  }) {
    return _then(_$DailyPicturesStateImpl(
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      dailyPictures: null == dailyPictures
          ? _value.dailyPictures
          : dailyPictures // ignore: cast_nullable_to_non_nullable
              as List<DailyPicture>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DailyPicturesStateImpl extends _DailyPicturesState {
  const _$DailyPicturesStateImpl(
      {required this.isLoadingMore,
      required this.dailyPictures,
      required this.errorMessage,
      required this.isConnected})
      : super._();

  @override
  final bool isLoadingMore;
  @override
  final List<DailyPicture> dailyPictures;
  @override
  final String? errorMessage;
  @override
  final bool isConnected;

  @override
  String toString() {
    return 'DailyPicturesState(isLoadingMore: $isLoadingMore, dailyPictures: $dailyPictures, errorMessage: $errorMessage, isConnected: $isConnected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyPicturesStateImpl &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            const DeepCollectionEquality()
                .equals(other.dailyPictures, dailyPictures) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoadingMore,
      const DeepCollectionEquality().hash(dailyPictures),
      errorMessage,
      isConnected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyPicturesStateImplCopyWith<_$DailyPicturesStateImpl> get copyWith =>
      __$$DailyPicturesStateImplCopyWithImpl<_$DailyPicturesStateImpl>(
          this, _$identity);
}

abstract class _DailyPicturesState extends DailyPicturesState {
  const factory _DailyPicturesState(
      {required final bool isLoadingMore,
      required final List<DailyPicture> dailyPictures,
      required final String? errorMessage,
      required final bool isConnected}) = _$DailyPicturesStateImpl;
  const _DailyPicturesState._() : super._();

  @override
  bool get isLoadingMore;
  @override
  List<DailyPicture> get dailyPictures;
  @override
  String? get errorMessage;
  @override
  bool get isConnected;
  @override
  @JsonKey(ignore: true)
  _$$DailyPicturesStateImplCopyWith<_$DailyPicturesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
