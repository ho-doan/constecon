import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/dialog/loading.dart';
import '../../../../core/common/widgets/toast/toast.dart';
import '../../../../core/generator/colors.gen.dart';
import '../../../../core/services/di/service_locator.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/styles.dart';
import '../../domain/use_case/partner_use_case.dart';
import 'bloc/partner_bloc.dart';

Handler partnerHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return BlocProvider(
    create: (context) => PartnerBloc(
      getIt<PartnerUseCase>(),
    )..add(PartnerInitEvent()),
    child: const PartnerPage(),
  );
});

class PartnerPage extends StatefulWidget {
  const PartnerPage({super.key});

  /// {@template constecon.lib.feature.partner.presentation.partner}
  /// ```dart
  /// Routes.router.navigateTo(
  ///   context,
  ///   RoutePath.partner,
  /// )
  /// ```
  /// {@endtemplate}
  static const String name = 'partner';

  @override
  State<PartnerPage> createState() => _PartnerPageState();
}

class _PartnerPageState extends State<PartnerPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<PartnerBloc, PartnerState>(
      listener: (context, state) {
        switch (state) {
          case PartnerLoading():
            LoadingDialog.instance.show();
            break;
          case PartnerFailure():
            LoadingDialog.instance.hide();
            ToastWidget.instance.showToast(
              state.error,
              backgroundColor: AppColors.red,
              messageColor: AppColors.white,
            );
            break;
          case PartnerSuccess():
            LoadingDialog.instance.hide();
            break;
        }
      },
      child: BlocBuilder<PartnerBloc, PartnerState>(
        builder: (context, state) {
          switch (state) {
            case PartnerInitial():
              return Container();
            case PartnerFailure():
              return Center(
                child: Text(
                  state.error,
                  style: AppTextStyle.normal.cp(color: AppColors.red),
                ),
              );
            case PartnerSuccess():
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
                    'Partner'.hardcode,
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
                        'constecon.lib.feature.partner.presentation.partner'
                            .hardcode,
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
