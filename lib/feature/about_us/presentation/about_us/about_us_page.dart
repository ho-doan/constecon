import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/dialog/loading.dart';
import '../../../../core/common/widgets/toast/toast.dart';
import '../../../../core/generator/colors.gen.dart';
import '../../../../core/services/di/service_locator.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/styles.dart';
import '../../domain/use_case/about_us_use_case.dart';
import 'bloc/about_us_bloc.dart';

Handler aboutUsHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return BlocProvider(
    create: (context) => AboutUsBloc(
      getIt<AboutUsUseCase>(),
    )..add(AboutUsInitEvent()),
    child: const AboutUsPage(),
  );
});

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  /// {@template constecon.lib.feature.about.us.presentation.about.us}
  /// ```dart
  /// Routes.router.navigateTo(
  ///   context,
  ///   RoutePath.aboutUs,
  /// )
  /// ```
  /// {@endtemplate}
  static const String name = 'about_us';

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AboutUsBloc, AboutUsState>(
      listener: (context, state) {
        switch (state) {
          case AboutUsLoading():
            LoadingDialog.instance.show();
            break;
          case AboutUsFailure():
            LoadingDialog.instance.hide();
            ToastWidget.instance.showToast(
              state.error,
              backgroundColor: AppColors.red,
              messageColor: AppColors.white,
            );
            break;
          case AboutUsSuccess():
            LoadingDialog.instance.hide();
            break;
        }
      },
      child: BlocBuilder<AboutUsBloc, AboutUsState>(
        builder: (context, state) {
          switch (state) {
            case AboutUsInitial():
              return Container();
            case AboutUsFailure():
              return Center(
                child: Text(
                  state.error,
                  style: AppTextStyle.normal.cp(color: AppColors.red),
                ),
              );
            case AboutUsSuccess():
              return Scaffold(
                appBar: AppBar(
                  leading: Center(
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.keyboard_backspace_outlined,
                        size: 24.sf,
                      ),
                    ),
                  ),
                  backgroundColor: AppColors.white,
                  centerTitle: true,
                  title: Text(
                    'AboutUs'.hardcode,
                    style: AppTextStyle.normal.cp(
                      height: 0,
                      fontSize: 16.sf,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.sf),
                  ),
                  shadowColor: AppColors.black.withOpacity(.2),
                ),
                backgroundColor: Colors.white,
                body: Padding(
                  padding: EdgeInsets.all(19.sf).copyWith(top: 16.sf),
                  child: Column(
                    children: [
                      Text(
                        'constecon.lib.feature.about.us.presentation.about.us'
                            .hardcode,
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
