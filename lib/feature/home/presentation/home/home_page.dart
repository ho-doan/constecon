import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/bar/base_app_bar.dart';
import '../../../../core/common/widgets/button/icon_button.dart';
import '../../../../core/common/widgets/dialog/loading.dart';
import '../../../../core/common/widgets/layout/adaptive/adaptive_layout.dart';
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
                appBar: const BaseAppBar(),
                backgroundColor: Colors.white,
                body: Padding(
                  padding: EdgeInsets.all(19.sf).copyWith(top: 16.sf),
                  child: Column(
                    children: [
                      const Section(),
                      Text(
                        'constecon.lib.feature.home.presentation.home'.hardcode,
                        style: AppTextStyle.normal.cp(
                          color: AppColors.primary300,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sf,
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

class Section extends StatelessWidget {
  const Section({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Adaptive(
      builder: (t) => Container(
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
                    fontSize: 30.24,
                    fontWeight: FontWeight.w400,
                    height: 30.24,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            IconButtonBase(
              callback: () {},
            ),
            IconButtonBase(
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
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        height: 24,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Assets.icon.back.svg(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
