import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/dialog/loading.dart';
import '../../../../core/common/widgets/toast/toast.dart';
import '../../../../core/generator/colors.gen.dart';
import '../../../../core/services/di/service_locator.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/styles.dart';
import '../../domain/use_case/new_use_case.dart';
import 'bloc/new_bloc.dart';

Handler newHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return BlocProvider(
    create: (context) => NewBloc(
      getIt<NewUseCase>(),
    )..add(NewInitEvent()),
    child: const NewPage(),
  );
});

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  /// {@template constecon.lib.feature.new.presentation.new}
  /// ```dart
  /// Routes.router.navigateTo(
  ///   context,
  ///   RoutePath.news,
  /// )
  /// ```
  /// {@endtemplate}
  static const String name = 'new';

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<NewBloc, NewState>(
      listener: (context, state) {
        switch (state) {
          case NewLoading():
            LoadingDialog.instance.show();
            break;
          case NewFailure():
            LoadingDialog.instance.hide();
            ToastWidget.instance.showToast(
              state.error,
              backgroundColor: AppColors.red,
              messageColor: AppColors.white,
            );
            break;
          case NewSuccess():
            LoadingDialog.instance.hide();
            break;
        }
      },
      child: BlocBuilder<NewBloc, NewState>(
        builder: (context, state) {
          switch (state) {
            case NewInitial():
              return Container();
            case NewFailure():
              return Center(
                child: Text(
                  state.error,
                  style: AppTextStyle.normal.cp(color: AppColors.red),
                ),
              );
            case NewSuccess():
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
                    'New'.hardcode,
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
                        'constecon.lib.feature.new.presentation.new'.hardcode,
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
