import 'package:flutter/material.dart';

enum XLayout {
  web,
  mobile,
}

typedef TCallback = T Function<T>();
typedef TLayout = Widget Function(XLayout, BoxConstraints);

extension XLayoutX on XLayout {
  bool get isWeb => this == XLayout.web;
  bool get isMobile => this == XLayout.mobile;
  T when<T>({
    required T onWeb,
    required T onMobile,
  }) {
    switch (this) {
      case XLayout.mobile:
        return onMobile;
      case XLayout.web:
        return onWeb;
    }
  }

  T whenFunc<T>({
    required T Function() onWeb,
    required T Function() onMobile,
  }) {
    switch (this) {
      case XLayout.mobile:
        return onMobile();
      case XLayout.web:
        return onWeb();
    }
  }

  T whenGrid<T>({
    required List<T> value,
    required T Function(List<T>) onWeb,
    required T Function(List<T>) onMobile,
  }) {
    switch (this) {
      case XLayout.mobile:
        return onMobile(value);
      case XLayout.web:
        return onWeb(value);
    }
  }
}

extension NumX on num {
  XLayout get layout {
    if (toDouble() > 600) {
      return XLayout.web;
    } else {
      return XLayout.mobile;
    }
  }
}

class Adaptive extends StatelessWidget {
  const Adaptive({
    super.key,
    required this.builder,
  });
  final TLayout builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        child: builder(constraints.maxWidth.layout, constraints),
      ),
    );
  }
}
