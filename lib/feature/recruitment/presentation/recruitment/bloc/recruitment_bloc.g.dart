// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recruitment_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RecruitmentSuccessCWProxy {
  RecruitmentSuccess counter(int counter);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RecruitmentSuccess(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RecruitmentSuccess(...).copyWith(id: 12, name: "My name")
  /// ````
  RecruitmentSuccess call({
    int? counter,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRecruitmentSuccess.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRecruitmentSuccess.copyWith.fieldName(...)`
class _$RecruitmentSuccessCWProxyImpl implements _$RecruitmentSuccessCWProxy {
  const _$RecruitmentSuccessCWProxyImpl(this._value);

  final RecruitmentSuccess _value;

  @override
  RecruitmentSuccess counter(int counter) => this(counter: counter);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RecruitmentSuccess(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RecruitmentSuccess(...).copyWith(id: 12, name: "My name")
  /// ````
  RecruitmentSuccess call({
    Object? counter = const $CopyWithPlaceholder(),
  }) {
    return RecruitmentSuccess(
      counter: counter == const $CopyWithPlaceholder() || counter == null
          ? _value.counter
          // ignore: cast_nullable_to_non_nullable
          : counter as int,
    );
  }
}

extension $RecruitmentSuccessCopyWith on RecruitmentSuccess {
  /// Returns a callable class that can be used as follows: `instanceOfRecruitmentSuccess.copyWith(...)` or like so:`instanceOfRecruitmentSuccess.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RecruitmentSuccessCWProxy get copyWith =>
      _$RecruitmentSuccessCWProxyImpl(this);
}
