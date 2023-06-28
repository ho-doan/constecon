import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
export 'package:flutter_gen/gen_l10n/s.dart';

class SizeUntil {
  SizeUntil._();
  static SizeUntil instance = SizeUntil._();
  static final view = WidgetsBinding.instance.platformDispatcher.implicitView;
  static final Size pS = view?.physicalSize ?? sizeDefault;
  static final dR = view?.devicePixelRatio ?? 1;
  static final Size _size = pS / dR;
  static Size get size => _size;
}

Size sizeDefault = const Size(375, 812);

final double heightFlex = sizeDefault.height.sf;
final double widthFlex = sizeDefault.width.sf;

extension NumEx on num {
  double get hf => SizeUntil.size.h(sizeDefault) * this;

  double get wf => SizeUntil.size.w(sizeDefault) * this;

  double get sf => SizeUntil.size.f(sizeDefault) * this;

  double get rf => SizeUntil.size.f(sizeDefault) * this;

  double height(num size) => sf / size.sf;
}

/// without size default [sizeDefault]
extension NumSize on Size {
  double h(Size size) => height / size.height;

  double w(Size size) => width / size.width;

  double f(Size size) =>
      width < height ? width / size.width : height / size.height;
}

class NumContext {
  NumContext(this.numBer, this.numHeight, this.context);
  final double numBer;
  final double numHeight;
  final BuildContext context;
}

extension SizeLayoutContext on BuildContext {
  Size get appSize => MediaQuery.of(this).size;

  EdgeInsets get padding => MediaQuery.of(this).padding;
}

enum Status {
  initial,
  loading,
  success,
  failure,
}

extension VStatus on Status {
  bool get isInitial => this == Status.initial;
  bool get isLoading => this == Status.loading;
  bool get isSuccess => this == Status.success;
  bool get isFailure => this == Status.failure;
  void when({
    // required VoidCallback initial,
    required VoidCallback onLoading,
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) {
    if (isLoading) onLoading();
    if (isSuccess) onSuccess();
    if (isFailure) onFailure();
  }
}

extension StringT on String {
  String get hardcode => this;
}

extension ExceptionCustomization on Exception {
  String decodeErrorResponse() {
    String message = '';
    if (runtimeType == DioException) {
      final dioException = this as DioException;
      if (dioException.response?.data != null) {
        message = dioException.response?.statusCode == 401
            ? ''
            : 'Undetected error from server';
        if (dioException.response?.data is Map) {
          final Map responseData = dioException.response?.data as Map;
          message = responseData['message'] ??
              responseData['Message'] ??
              'Could not parse the response';
        }
      }
    }

    return message;
  }
}

extension SB on num {
  Widget get vertical => SizedBox(
        height: toDouble(),
      );
  Widget get horizontal => SizedBox(
        width: toDouble(),
      );
  double textHeight(num size) => this / size;
}
