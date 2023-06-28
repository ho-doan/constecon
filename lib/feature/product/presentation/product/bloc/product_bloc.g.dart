// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProductSuccessCWProxy {
  ProductSuccess counter(int counter);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductSuccess(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductSuccess(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductSuccess call({
    int? counter,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProductSuccess.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProductSuccess.copyWith.fieldName(...)`
class _$ProductSuccessCWProxyImpl implements _$ProductSuccessCWProxy {
  const _$ProductSuccessCWProxyImpl(this._value);

  final ProductSuccess _value;

  @override
  ProductSuccess counter(int counter) => this(counter: counter);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductSuccess(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductSuccess(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductSuccess call({
    Object? counter = const $CopyWithPlaceholder(),
  }) {
    return ProductSuccess(
      counter: counter == const $CopyWithPlaceholder() || counter == null
          ? _value.counter
          // ignore: cast_nullable_to_non_nullable
          : counter as int,
    );
  }
}

extension $ProductSuccessCopyWith on ProductSuccess {
  /// Returns a callable class that can be used as follows: `instanceOfProductSuccess.copyWith(...)` or like so:`instanceOfProductSuccess.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProductSuccessCWProxy get copyWith => _$ProductSuccessCWProxyImpl(this);
}
