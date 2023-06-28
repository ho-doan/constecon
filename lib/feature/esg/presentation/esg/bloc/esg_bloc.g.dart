// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'esg_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EsgSuccessCWProxy {
  EsgSuccess counter(int counter);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EsgSuccess(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EsgSuccess(...).copyWith(id: 12, name: "My name")
  /// ````
  EsgSuccess call({
    int? counter,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEsgSuccess.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEsgSuccess.copyWith.fieldName(...)`
class _$EsgSuccessCWProxyImpl implements _$EsgSuccessCWProxy {
  const _$EsgSuccessCWProxyImpl(this._value);

  final EsgSuccess _value;

  @override
  EsgSuccess counter(int counter) => this(counter: counter);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EsgSuccess(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EsgSuccess(...).copyWith(id: 12, name: "My name")
  /// ````
  EsgSuccess call({
    Object? counter = const $CopyWithPlaceholder(),
  }) {
    return EsgSuccess(
      counter: counter == const $CopyWithPlaceholder() || counter == null
          ? _value.counter
          // ignore: cast_nullable_to_non_nullable
          : counter as int,
    );
  }
}

extension $EsgSuccessCopyWith on EsgSuccess {
  /// Returns a callable class that can be used as follows: `instanceOfEsgSuccess.copyWith(...)` or like so:`instanceOfEsgSuccess.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EsgSuccessCWProxy get copyWith => _$EsgSuccessCWProxyImpl(this);
}
