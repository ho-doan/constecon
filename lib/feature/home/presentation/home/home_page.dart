import 'dart:developer';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../core/common/widgets/bar/base_app_bar.dart';
import '../../../../core/common/widgets/button/icon_button.dart';
import '../../../../core/common/widgets/dialog/loading.dart';
import '../../../../core/common/widgets/layout/adaptive/adaptive_layout.dart';
import '../../../../core/common/widgets/layout/card/layout_card.dart';
import '../../../../core/common/widgets/toast/toast.dart';
import '../../../../core/generator/assets.gen.dart';
import '../../../../core/generator/colors.gen.dart';
import '../../../../core/services/di/service_locator.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/styles.dart';
import '../../domain/use_case/home_use_case.dart';
import 'bloc/home_bloc.dart';

Handler homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return BlocProvider(
    create: (context) => HomeBloc(
      getIt<HomeUseCase>(),
    )..add(HomeInitEvent()),
    child: const HomePage(),
  );
});

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  /// {@template constecon.lib.feature.home.presentation.home}
  /// ```dart
  /// Routes.router.navigateTo(
  ///   context,
  ///   RoutePath.home,
  /// )
  /// ```
  /// {@endtemplate}
  static const String name = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ScrollController();
  Color color = Colors.transparent;
  @override
  void initState() {
    controller.addListener(_listenColor);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(_listenColor);
    super.dispose();
  }

  void _listenColor() {
    if (controller.position.pixels <= 0) {
      setState(() => color = Colors.transparent);
    } else {
      setState(() => color = Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        switch (state) {
          case HomeLoading():
            LoadingDialog.instance.show();
            break;
          case HomeFailure():
            LoadingDialog.instance.hide();
            ToastWidget.instance.showToast(
              state.error,
              backgroundColor: AppColors.red,
              messageColor: AppColors.white,
            );
            break;
          case HomeSuccess():
            LoadingDialog.instance.hide();
            break;
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          switch (state) {
            case HomeInitial():
              return Container();
            case HomeFailure():
              return Center(
                child: Text(
                  state.error,
                  style: AppTextStyle.normal.cp(color: AppColors.red),
                ),
              );
            case HomeSuccess():
              return Scaffold(
                extendBodyBehindAppBar: true,
                backgroundColor: Colors.white,
                appBar: BaseAppBar(
                  color: color,
                ),
                body: Adaptive(
                  builder: (t, c) => CustomScrollView(
                    controller: controller,
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            SlideWidget(
                              t: t,
                              c: c,
                            ),
                            CardX(
                              t: t,
                              c: c,
                              callback: () {},
                              child: [
                                Text(
                                  'message',
                                  style: AppTextStyle.normal,
                                ),
                                Text(
                                  'message',
                                  style: AppTextStyle.normal,
                                ),
                                Text(
                                  'message',
                                  style: AppTextStyle.normal,
                                ),
                              ],
                            ),
                            CardX(
                              t: t,
                              c: c,
                              layoutCard: LayoutCard.none,
                              child: [
                                Assets.image.elementorSlidesWrapper.image(),
                                Assets.image.elementorSlidesWrapper.image(),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: Assets.image.backgroundGrid.provider(),
                                ),
                              ),
                              child: StaggeredGrid.count(
                                crossAxisCount: 36,
                                children: [
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 16,
                                    mainAxisCellCount: 9,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Assets.icon.building.svg(),
                                        ),
                                        5.horizontal,
                                      ],
                                    ),
                                  ),
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 8,
                                    mainAxisCellCount: 4,
                                    child: Container(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 5,
                                    mainAxisCellCount: 5,
                                    child: Container(
                                      color: AppColors.pictonBlue,
                                    ),
                                  ),
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 7,
                                    mainAxisCellCount: 5,
                                    child: Container(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 8,
                                    mainAxisCellCount: 5,
                                    child: Container(
                                      color: AppColors.bigFootFeet,
                                      child: Center(
                                        child: IntroGrid(
                                          t: t,
                                          title: 200.toString().hardcode,
                                          message: 'Managers',
                                        ),
                                      ),
                                    ),
                                  ),
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 12,
                                    mainAxisCellCount: 9,
                                    child: Assets.image.productSomePerson.image(
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 12,
                                    mainAxisCellCount: 5,
                                    child: Container(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 7,
                                    mainAxisCellCount: 10,
                                    child: Assets.image.productPerson.image(
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 12,
                                    mainAxisCellCount: 5,
                                    child: Container(
                                      color: Colors.transparent,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 8,
                                            child: Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              color: AppColors.fireOpal,
                                              child: Row(
                                                children: [
                                                  const Spacer(),
                                                  Since(
                                                    t: t,
                                                    message: '2004'.hardcode,
                                                  ),
                                                  const Spacer(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 5,
                                    mainAxisCellCount: 5,
                                    child: Container(
                                      color: AppColors.fireOpal,
                                    ),
                                  ),
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 5,
                                    mainAxisCellCount: 5,
                                    child: Assets.icon.point.image(
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 8,
                                    mainAxisCellCount: 5,
                                    child: Container(
                                      //TODO: hard color
                                      color: AppColors.red,
                                      child: Center(
                                        child: IntroGrid(
                                          t: t,
                                          title: '1400'.hardcode,
                                          message: 'Engine work',
                                        ),
                                      ),
                                    ),
                                  ),
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 4,
                                    mainAxisCellCount: 5,
                                    child: Container(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 1,
                                    mainAxisCellCount: 5,
                                    child: Container(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 9,
                                    mainAxisCellCount: 5,
                                    child: Assets.image.product.image(
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 6,
                                    mainAxisCellCount: 5,
                                    child: Container(
                                      color: Colors.green,
                                    ),
                                  ),
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 8,
                                    mainAxisCellCount: 5,
                                    child: Container(
                                      color: AppColors.ceruleanBlue,
                                      child: Center(
                                        child: IntroGrid(
                                          title: 500.toString().hardcode,
                                          message: 'product'.hardcode,
                                          t: t,
                                        ),
                                      ),
                                    ),
                                  ),
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 12,
                                    mainAxisCellCount: 5,
                                    child: Center(
                                      child: Assets.icon.logoGrid.image(
                                        height: c.maxWidth / 30,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            OutFocus(
                              t: t,
                              values: [
                                OutFocusModel(name: 'CON'),
                                OutFocusModel(name: 'INV'),
                                OutFocusModel(name: 'ENV'),
                                OutFocusModel(name: 'DIV'),
                              ],
                            ),
                            Text(
                              'constecon.lib.feature.home.presentation.home'
                                  .hardcode,
                              style: AppTextStyle.normal.cp(
                                color: AppColors.primary300,
                                fontWeight: FontWeight.w700,
                                height: 16,
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
          return Container();
        },
      ),
    );
  }
}

class IntroGrid extends StatelessWidget {
  const IntroGrid({
    super.key,
    required this.t,
    required this.title,
    required this.message,
  });

  final XLayout t;
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: title,
            style: AppTextStyle.normal.cp(
              color: AppColors.white,
              height: 0,
              fontWeight: FontWeight.w700,
            ),
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.top,
                child: Text(
                  '+',
                  style: AppTextStyle.normal.cp(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
          TextSpan(
            text: '\n$message'.hardcode,
            style: AppTextStyle.normal.cp(
              color: AppColors.white,
              height: 0,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.start,
    );
  }
}

class Since extends StatelessWidget {
  const Since({
    super.key,
    required this.t,
    required this.message,
  });

  final XLayout t;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Since'.toUpperCase().hardcode,
            style: AppTextStyle.normal.cp(
              color: AppColors.white,
              height: 0,
            ),
          ),
          TextSpan(
            text: '\n$message',
            style: AppTextStyle.normal.cp(
              color: AppColors.white,
              height: 0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.start,
    );
  }
}

class OutFocusModel {
  OutFocusModel({
    required this.name,
  });

  final String name;
}

class OutFocus extends StatelessWidget {
  const OutFocus({
    super.key,
    required this.values,
    required this.t,
  });
  final List<OutFocusModel> values;
  final XLayout t;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Out focus'.hardcode,
          style: AppTextStyle.normal,
        ),
        15.vertical,
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'VIEW OUR FOCUS'.hardcode,
                  style: AppTextStyle.normal.rmHeight,
                ),
                6.horizontal,
                Assets.icon.icMore.svg(
                  width: 16,
                  height: 16,
                )
              ],
            ),
          ),
        ),
        10.vertical,
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => HomeSlideVertical(
            values: values,
            t: t,
            index: index,
          ),
          separatorBuilder: (context, index) => const SizedBox.shrink(),
          itemCount: 4,
        ),
      ],
    );
  }
}

class HomeSlideVertical extends StatefulWidget {
  const HomeSlideVertical({
    super.key,
    required this.values,
    required this.t,
    required this.index,
  });

  final List<OutFocusModel> values;
  final XLayout t;
  final int index;

  @override
  State<HomeSlideVertical> createState() => _HomeSlideVerticalState();
}

class _HomeSlideVerticalState extends State<HomeSlideVertical> {
  @override
  Widget build(BuildContext context) {
    return FormField<bool>(builder: (field) {
      return InkWell(
        onTap: () {
          log('message');
        },
        onHover: (v) => field.didChange(v),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '/0${widget.index + 1}',
                        style: AppTextStyle.normal,
                      ),
                      Text(
                        widget.values[widget.index].name,
                        style: AppTextStyle.normal.copyWith(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  if (widget.t.isMobile)
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Assets.icon.icMore.svg(
                          width: 16,
                          height: 16,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Positioned.fill(
              child: Row(
                children: [
                  Expanded(
                    child: AnimatedOpacity(
                      opacity: field.value ?? false ? 1 : 0,
                      duration: const Duration(seconds: 1),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                        ),
                        child: Column(
                          children: [
                            Text('data'),
                            Text('data'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class Section extends StatelessWidget {
  const Section({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Adaptive(
      builder: (t, _) => Container(
        color: Color(0xFF16315E),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'TIN MỚI NHẤT'.hardcode,
                  style: AppTextStyle.normal.cp(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    height: 30.24,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            IconButtonBase(
              t: t,
              callback: () {},
            ),
            IconButtonBase(
              t: t,
              type: IconButtonType.right,
              callback: () {},
            ),
            Expanded(
              flex: 7,
              child: Row(
                children: [
                  10.horizontal,
                  Expanded(
                    child: Text(
                      'Tiểu ban ESG chính thức ra mắt logo MỚI',
                      style: AppTextStyle.normal.cp(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        height: 24,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Center(
                    child: Assets.icon.icMore.svg(
                      width: 20,
                      height: 20,
                    ),
                  ),
                  10.horizontal,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
