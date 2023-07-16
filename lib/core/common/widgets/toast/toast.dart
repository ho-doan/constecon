import 'dart:async';
import 'package:flutter/material.dart';

import '../../../../app.dart';
import '../../../generator/colors.gen.dart';
import '../../../utils/extensions.dart';
import '../../../utils/styles.dart';
import '../dialog/loading.dart';
import '../layout/adaptive/adaptive_layout.dart';

class ToastWidget {
  ToastWidget._();
  static ToastWidget instance = ToastWidget._();
  OverlayEntry? _overlay;
  Timer? lifeTime;
  void showToast(
    String message, {
    Color? messageColor,
    XLayout? t,
    Color? backgroundColor,
    int? seconds,
    String? icon,
    TextStyle? style,
    Widget? child,
    bool hideLoading = false,
  }) {
    if (hideLoading) {
      LoadingDialog.instance.hide();
    }
    if (_overlay == null) {
      startTimer(seconds: seconds);
      _overlay = OverlayEntry(
        builder: (context) => GestureDetector(
          onTap: () {
            hideToastV2();
          },
          child: Material(
            type: MaterialType.transparency,
            child: BuildBodyWidget(
              t: t ?? XLayout.mobile,
              message: message,
              backgroundColor: backgroundColor,
              messageColor: messageColor,
              seconds: seconds,
              icon: icon,
              style: style,
              child: child,
            ),
          ),
        ),
      );
      Overlay.of(navigatorKey.currentState!.context).insert(_overlay!);
    } else {
      // hideToastV2();
      // showToastV2(message,
      //     messageColor: messageColor, backgroundColor: backgroundColor);
    }
  }

  void hideToastV2() {
    _overlay?.remove();
    _overlay = null;
  }

  void startTimer({int? seconds}) {
    lifeTime?.cancel();
    lifeTime = Timer(Duration(seconds: seconds ?? 4), () {
      hideToastV2();
    });
  }
}

class BuildBodyWidget extends StatefulWidget {
  const BuildBodyWidget(
      {super.key,
      required this.message,
      this.backgroundColor,
      this.messageColor,
      this.child,
      this.icon,
      this.style,
      this.seconds,
      required this.t});
  final Color? messageColor;
  final Color? backgroundColor;
  final int? seconds;
  final String message;
  final String? icon;
  final Widget? child;
  final TextStyle? style;
  final XLayout t;
  @override
  State<BuildBodyWidget> createState() => _BuildBodyWidgetState();
}

class _BuildBodyWidgetState extends State<BuildBodyWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> position;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    position = Tween<Offset>(begin: const Offset(0.0, -1.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SlideTransition(
        position: position,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: widget.backgroundColor ?? AppColors.primaryColor,
              ),
              margin: EdgeInsets.symmetric(horizontal: 10.sf),
              padding: EdgeInsets.symmetric(
                vertical: 12.sf,
                horizontal: 10.sf,
              ),
              child: Row(
                children: [
                  if (widget.icon != null)
                    Padding(
                      padding: EdgeInsets.only(right: 10.sf),
                      child: const Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                    ),
                  Expanded(
                    child: Text(
                      widget.message,
                      textAlign: widget.icon == null ? TextAlign.center : null,
                      style: (widget.style ?? AppTextStyle.normal).copyWith(
                        color: widget.messageColor ?? AppColors.white,
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
