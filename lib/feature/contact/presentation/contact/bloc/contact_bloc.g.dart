// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ContactSuccessCWProxy {
  ContactSuccess counter(int counter);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ContactSuccess(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ContactSuccess(...).copyWith(id: 12, name: "My name")
  /// ````
  ContactSuccess call({
    int? counter,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfContactSuccess.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfContactSuccess.copyWith.fieldName(...)`
class _$ContactSuccessCWProxyImpl implements _$ContactSuccessCWProxy {
  const _$ContactSuccessCWProxyImpl(this._value);

  final ContactSuccess _value;

  @override
  ContactSuccess counter(int counter) => this(counter: counter);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ContactSuccess(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ContactSuccess(...).copyWith(id: 12, name: "My name")
  /// ````
  ContactSuccess call({
    Object? counter = const $CopyWithPlaceholder(),
  }) {
    return ContactSuccess(
      counter: counter == const $CopyWithPlaceholder() || counter == null
          ? _value.counter
          // ignore: cast_nullable_to_non_nullable
          : counter as int,
    );
  }
}

extension $ContactSuccessCopyWith on ContactSuccess {
  /// Returns a callable class that can be used as follows: `instanceOfContactSuccess.copyWith(...)` or like so:`instanceOfContactSuccess.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ContactSuccessCWProxy get copyWith => _$ContactSuccessCWProxyImpl(this);
}
