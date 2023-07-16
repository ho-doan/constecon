import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../feature/home/presentation/home/home_page.dart';
import '../../../generator/assets.gen.dart';
import '../../../generator/colors.gen.dart';
import '../../../utils/extensions.dart';
import '../../../utils/styles.dart';
import '../layout/adaptive/adaptive_layout.dart';

class BaseAppBar extends PreferredSize {
  const BaseAppBar({
    this.color = Colors.transparent,
    super.key,
    super.preferredSize = const Size.fromHeight(77),
    super.child = const SizedBox(),
  });
  final Color color;
  @override
  Widget get child => Adaptive(
        builder: (t, c) => Builder(
          builder: (context) {
            return AppBar(
              toolbarHeight: 77,
              leadingWidth: t.when(onWeb: 220, onMobile: null),
              leading: _Leading(t: t),
              backgroundColor: color,
              centerTitle: true,
              title: Assets.icon.logo.svg(),
              actions: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'EN'.hardcode,
                        style: AppTextStyle.normal.cp(
                          color: AppColors.rainbow.withOpacity(.15),
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 2,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      color: AppColors.rainbow.withOpacity(.15),
                    ),
                    Text(
                      'VN'.hardcode,
                      style: AppTextStyle.normal.cp(
                        color: AppColors.rainbow,
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    20.horizontal,
                  ],
                ),
              ],
              // flexibleSpace: SlideWidget(t: t, c: c),
              elevation: 8,
              shadowColor: AppColors.black.withOpacity(.2),
            );
          },
        ),
      );
}

class BAppBar extends SliverAppBar {
  const BAppBar({
    required this.c,
    super.key,
    required this.t,
    super.expandedHeight,
    super.collapsedHeight,
    super.snap = true,
    super.pinned = true,
    super.floating = true,
  }) : super(
          toolbarHeight: 77,
          backgroundColor: AppColors.white,
          centerTitle: true,
          elevation: 8,
        );
  final XLayout t;
  final BoxConstraints c;

  @override
  double? get leadingWidth => t.when(onWeb: 220, onMobile: null);
  @override
  Widget? get leading => _Leading(t: t);
  @override
  Widget? get title => Assets.icon.logo.svg();
  @override
  Color? get shadowColor => AppColors.black.withOpacity(.2);
  // @override
  // Widget? get flexibleSpace => FlexibleSpaceBar(
  //       title: Container(),
  //       background: SlideWidget(
  //         t: t,
  //         c: c,
  //       ),
  //     );
  @override
  List<Widget>? get actions => [
        Builder(builder: (context) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'EN'.hardcode,
                style: AppTextStyle.normal.cp(
                  color: AppColors.rainbow.withOpacity(.15),
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              Container(
                height: 20,
                width: 2,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                color: AppColors.rainbow.withOpacity(.15),
              ),
              Text(
                'VN'.hardcode,
                style: AppTextStyle.normal.cp(
                  color: AppColors.rainbow,
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              20.horizontal,
            ],
          );
        }),
      ];
}

class _Leading extends StatelessWidget {
  const _Leading({
    required this.t,
  });

  final XLayout t;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        t.when(
          onWeb: 30.horizontal,
          onMobile: Container(),
        ),
        Center(
          child: Assets.icon.option.svg(
            width: 24,
            height: 24,
            fit: BoxFit.cover,
          ),
        ),
        t.when(
          onWeb: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              19.horizontal,
              Text(
                'MENU'.hardcode,
                style: AppTextStyle.normal.cp(
                  color: AppColors.rainbow,
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              20.horizontal,
              Container(
                height: double.infinity,
                width: 1,
                color: AppColors.rainbow.withOpacity(.15),
              ),
              30.horizontal,
              Assets.icon.search.svg(),
            ],
          ),
          onMobile: Container(),
        ),
      ],
    );
  }
}

class SlideWidget extends StatefulWidget {
  const SlideWidget({
    super.key,
    required this.t,
    required this.c,
  });
  final XLayout t;
  final BoxConstraints c;

  @override
  State<SlideWidget> createState() => _SlideWidgetState();
}

class _SlideWidgetState extends State<SlideWidget> {
  PageController controller = PageController();
  int i = 0;
  bool isShow = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => isShow = true);
      timer ??= Timer.periodic(const Duration(seconds: 5), (_) {
        _next();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _next() {
    setState(() => isShow = false);
    controller.nextPage(
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOut,
    );
    if (i == 4) {
      controller.jumpToPage(0);
    }
  }

  void _pre() {
    setState(() => isShow = false);
    controller.previousPage(
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOut,
    );
    if (i == 0) {
      controller.jumpToPage(4);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: widget.c.maxWidth,
          height: widget.c.maxHeight,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    GestureDetector(
                      onPanUpdate: (data) {
                        if (data.delta.dx < 0) {
                          _next();
                        }

                        if (data.delta.dx > 0) {
                          _pre();
                        }
                      },
                      child: PageView(
                        controller: controller,
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (value) {
                          setState(() {
                            i = value;
                            isShow = true;
                          });
                        },
                        children: [
                          Assets.image.elementorSlidesWrapper.image(
                            width: widget.c.maxWidth,
                            fit: BoxFit.fill,
                          ),
                          Assets.image.elementorSlidesWrapper.image(
                            width: widget.c.maxWidth,
                            fit: BoxFit.fill,
                          ),
                          Assets.image.elementorSlidesWrapper.image(
                            width: widget.c.maxWidth,
                            fit: BoxFit.fill,
                          ),
                          Assets.image.elementorSlidesWrapper.image(
                            width: widget.c.maxWidth,
                            fit: BoxFit.fill,
                          ),
                          Assets.image.elementorSlidesWrapper.image(
                            width: widget.c.maxWidth,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                    if (widget.t.isWeb)
                      Positioned.fill(
                        left: 30,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: _ButtonIcon(
                            callback: () {
                              _pre();
                            },
                            child: Assets.icon.back.svg(),
                          ),
                        ),
                      ),
                    if (widget.t.isWeb)
                      Positioned.fill(
                        right: 30,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: _ButtonIcon(
                            callback: () {
                              _next();
                            },
                            child: Assets.icon.next.svg(),
                          ),
                        ),
                      ),
                    AnimatedPositioned(
                      bottom: isShow ? 20 : -(widget.c.maxHeight * .6),
                      right: widget.t.when(onWeb: 90, onMobile: 10),
                      duration: const Duration(milliseconds: 750),
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 750),
                        opacity: 1,
                        child: !isShow
                            ? Container()
                            : Container(
                                decoration: BoxDecoration(
                                  color: Colors.indigo[700],
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(widget.t
                                          .when(onWeb: 40, onMobile: 10)),
                                      constraints:
                                          const BoxConstraints(maxWidth: 400),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Diamond Crown Hai Phong',
                                            style: AppTextStyle.normal.cp(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            'Nhà máy sản xuất ô tô thương hiệu\nViệt duy nhất',
                                            style: AppTextStyle.normal.cp(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color:
                                              AppColors.black.withOpacity(.15),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Assets.icon.icMore.svg(
                                          width: 18,
                                          height: 18,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              const Section(),
            ],
          ),
        ),
      ],
    );
  }
}

class _ButtonIcon extends StatelessWidget {
  const _ButtonIcon({
    required this.child,
    required this.callback,
  });

  final Widget child;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: AppColors.black.withOpacity(.15),
          borderRadius: BorderRadius.circular(4),
        ),
        child: child,
      ),
    );
  }
}
