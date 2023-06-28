// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NewSuccessCWProxy {
  NewSuccess counter(int counter);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NewSuccess(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NewSuccess(...).copyWith(id: 12, name: "My name")
  /// ````
  NewSuccess call({
    int? counter,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNewSuccess.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNewSuccess.copyWith.fieldName(...)`
class _$NewSuccessCWProxyImpl implements _$NewSuccessCWProxy {
  const _$NewSuccessCWProxyImpl(this._value);

  final NewSuccess _value;

  @override
  NewSuccess counter(int counter) => this(counter: counter);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NewSuccess(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NewSuccess(...).copyWith(id: 12, name: "My name")
  /// ````
  NewSuccess call({
    Object? counter = const $CopyWithPlaceholder(),
  }) {
    return NewSuccess(
      counter: counter == const $CopyWithPlaceholder() || counter == null
          ? _value.counter
          // ignore: cast_nullable_to_non_nullable
          : counter as int,
    );
  }
}

extension $NewSuccessCopyWith on NewSuccess {
  /// Returns a callable class that can be used as follows: `instanceOfNewSuccess.copyWith(...)` or like so:`instanceOfNewSuccess.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NewSuccessCWProxy get copyWith => _$NewSuccessCWProxyImpl(this);
}
