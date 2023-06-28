// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_us_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AboutUsSuccessCWProxy {
  AboutUsSuccess counter(int counter);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AboutUsSuccess(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AboutUsSuccess(...).copyWith(id: 12, name: "My name")
  /// ````
  AboutUsSuccess call({
    int? counter,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAboutUsSuccess.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAboutUsSuccess.copyWith.fieldName(...)`
class _$AboutUsSuccessCWProxyImpl implements _$AboutUsSuccessCWProxy {
  const _$AboutUsSuccessCWProxyImpl(this._value);

  final AboutUsSuccess _value;

  @override
  AboutUsSuccess counter(int counter) => this(counter: counter);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AboutUsSuccess(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AboutUsSuccess(...).copyWith(id: 12, name: "My name")
  /// ````
  AboutUsSuccess call({
    Object? counter = const $CopyWithPlaceholder(),
  }) {
    return AboutUsSuccess(
      counter: counter == const $CopyWithPlaceholder() || counter == null
          ? _value.counter
          // ignore: cast_nullable_to_non_nullable
          : counter as int,
    );
  }
}

extension $AboutUsSuccessCopyWith on AboutUsSuccess {
  /// Returns a callable class that can be used as follows: `instanceOfAboutUsSuccess.copyWith(...)` or like so:`instanceOfAboutUsSuccess.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AboutUsSuccessCWProxy get copyWith => _$AboutUsSuccessCWProxyImpl(this);
}
