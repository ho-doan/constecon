import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/dialog/loading.dart';
import '../../../../core/common/widgets/toast/toast.dart';
import '../../../../core/generator/colors.gen.dart';
import '../../../../core/services/di/service_locator.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/styles.dart';
import '../../domain/use_case/esg_use_case.dart';
import 'bloc/esg_bloc.dart';

Handler esgHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return BlocProvider(
    create: (context) => EsgBloc(
      getIt<EsgUseCase>(),
    )..add(EsgInitEvent()),
    child: const EsgPage(),
  );
});

class EsgPage extends StatefulWidget {
  const EsgPage({super.key});

  /// {@template constecon.lib.feature.esg.presentation.esg}
  /// ```dart
  /// Routes.router.navigateTo(
  ///   context,
  ///   RoutePath.esg,
  /// )
  /// ```
  /// {@endtemplate}
  static const String name = 'esg';

  @override
  State<EsgPage> createState() => _EsgPageState();
}

class _EsgPageState extends State<EsgPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<EsgBloc, EsgState>(
      listener: (context, state) {
        switch (state) {
          case EsgLoading():
            LoadingDialog.instance.show();
            break;
          case EsgFailure():
            LoadingDialog.instance.hide();
            ToastWidget.instance.showToast(
              state.error,
              backgroundColor: AppColors.red,
              messageColor: AppColors.white,
            );
            break;
          case EsgSuccess():
            LoadingDialog.instance.hide();
            break;
        }
      },
      child: BlocBuilder<EsgBloc, EsgState>(
        builder: (context, state) {
          switch (state) {
            case EsgInitial():
              return Container();
            case EsgFailure():
              return Center(
                child: Text(
                  state.error,
                  style: AppTextStyle.normal.cp(color: AppColors.red),
                ),
              );
            case EsgSuccess():
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
                    'Esg'.hardcode,
                    style: AppTextStyle.normal.cp(
                      height: 0,
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
                        'constecon.lib.feature.esg.presentation.esg'.hardcode,
                        style: AppTextStyle.normal.cp(
                          color: AppColors.primary300,
                          fontWeight: FontWeight.w700,
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
