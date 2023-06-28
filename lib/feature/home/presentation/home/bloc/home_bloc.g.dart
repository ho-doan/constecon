// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HomeSuccessCWProxy {
  HomeSuccess counter(int counter);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeSuccess(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeSuccess(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeSuccess call({
    int? counter,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHomeSuccess.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHomeSuccess.copyWith.fieldName(...)`
class _$HomeSuccessCWProxyImpl implements _$HomeSuccessCWProxy {
  const _$HomeSuccessCWProxyImpl(this._value);

  final HomeSuccess _value;

  @override
  HomeSuccess counter(int counter) => this(counter: counter);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeSuccess(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeSuccess(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeSuccess call({
    Object? counter = const $CopyWithPlaceholder(),
  }) {
    return HomeSuccess(
      counter: counter == const $CopyWithPlaceholder() || counter == null
          ? _value.counter
          // ignore: cast_nullable_to_non_nullable
          : counter as int,
    );
  }
}

extension $HomeSuccessCopyWith on HomeSuccess {
  /// Returns a callable class that can be used as follows: `instanceOfHomeSuccess.copyWith(...)` or like so:`instanceOfHomeSuccess.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HomeSuccessCWProxy get copyWith => _$HomeSuccessCWProxyImpl(this);
}
