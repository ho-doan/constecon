// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PartnerSuccessCWProxy {
  PartnerSuccess counter(int counter);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PartnerSuccess(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PartnerSuccess(...).copyWith(id: 12, name: "My name")
  /// ````
  PartnerSuccess call({
    int? counter,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPartnerSuccess.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPartnerSuccess.copyWith.fieldName(...)`
class _$PartnerSuccessCWProxyImpl implements _$PartnerSuccessCWProxy {
  const _$PartnerSuccessCWProxyImpl(this._value);

  final PartnerSuccess _value;

  @override
  PartnerSuccess counter(int counter) => this(counter: counter);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PartnerSuccess(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PartnerSuccess(...).copyWith(id: 12, name: "My name")
  /// ````
  PartnerSuccess call({
    Object? counter = const $CopyWithPlaceholder(),
  }) {
    return PartnerSuccess(
      counter: counter == const $CopyWithPlaceholder() || counter == null
          ? _value.counter
          // ignore: cast_nullable_to_non_nullable
          : counter as int,
    );
  }
}

extension $PartnerSuccessCopyWith on PartnerSuccess {
  /// Returns a callable class that can be used as follows: `instanceOfPartnerSuccess.copyWith(...)` or like so:`instanceOfPartnerSuccess.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PartnerSuccessCWProxy get copyWith => _$PartnerSuccessCWProxyImpl(this);
}
