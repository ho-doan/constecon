import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/dialog/loading.dart';
import '../../../../core/common/widgets/toast/toast.dart';
import '../../../../core/generator/colors.gen.dart';
import '../../../../core/services/di/service_locator.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/styles.dart';
import '../../domain/use_case/recruitment_use_case.dart';
import 'bloc/recruitment_bloc.dart';

Handler recruitmentHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return BlocProvider(
    create: (context) => RecruitmentBloc(
      getIt<RecruitmentUseCase>(),
    )..add(RecruitmentInitEvent()),
    child: const RecruitmentPage(),
  );
});

class RecruitmentPage extends StatefulWidget {
  const RecruitmentPage({super.key});

  /// {@template constecon.lib.feature.recruitment.presentation.recruitment}
  /// ```dart
  /// Routes.router.navigateTo(
  ///   context,
  ///   RoutePath.recruitment,
  /// )
  /// ```
  /// {@endtemplate}
  static const String name = 'recruitment';

  @override
  State<RecruitmentPage> createState() => _RecruitmentPageState();
}

class _RecruitmentPageState extends State<RecruitmentPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RecruitmentBloc, RecruitmentState>(
      listener: (context, state) {
        switch (state) {
          case RecruitmentLoading():
            LoadingDialog.instance.show();
            break;
          case RecruitmentFailure():
            LoadingDialog.instance.hide();
            ToastWidget.instance.showToast(
              state.error,
              backgroundColor: AppColors.red,
              messageColor: AppColors.white,
            );
            break;
          case RecruitmentSuccess():
            LoadingDialog.instance.hide();
            break;
        }
      },
      child: BlocBuilder<RecruitmentBloc, RecruitmentState>(
        builder: (context, state) {
          switch (state) {
            case RecruitmentInitial():
              return Container();
            case RecruitmentFailure():
              return Center(
                child: Text(
                  state.error,
                  style: AppTextStyle.normal.cp(color: AppColors.red),
                ),
              );
            case RecruitmentSuccess():
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
                    'Recruitment'.hardcode,
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
                        'constecon.lib.feature.recruitment.presentation.recruitment'
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
