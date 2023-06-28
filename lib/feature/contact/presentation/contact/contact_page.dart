import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/dialog/loading.dart';
import '../../../../core/common/widgets/toast/toast.dart';
import '../../../../core/generator/colors.gen.dart';
import '../../../../core/services/di/service_locator.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/styles.dart';
import '../../domain/use_case/contact_use_case.dart';
import 'bloc/contact_bloc.dart';

Handler contactHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return BlocProvider(
    create: (context) => ContactBloc(
      getIt<ContactUseCase>(),
    )..add(ContactInitEvent()),
    child: const ContactPage(),
  );
});

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  /// {@template constecon.lib.feature.contact.presentation.contact}
  /// ```dart
  /// Routes.router.navigateTo(
  ///   context,
  ///   RoutePath.contact,
  /// )
  /// ```
  /// {@endtemplate}
  static const String name = 'contact';

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ContactBloc, ContactState>(
      listener: (context, state) {
        switch (state) {
          case ContactLoading():
            LoadingDialog.instance.show();
            break;
          case ContactFailure():
            LoadingDialog.instance.hide();
            ToastWidget.instance.showToast(
              state.error,
              backgroundColor: AppColors.red,
              messageColor: AppColors.white,
            );
            break;
          case ContactSuccess():
            LoadingDialog.instance.hide();
            break;
        }
      },
      child: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          switch (state) {
            case ContactInitial():
              return Container();
            case ContactFailure():
              return Center(
                child: Text(
                  state.error,
                  style: AppTextStyle.normal.cp(color: AppColors.red),
                ),
              );
            case ContactSuccess():
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
                    'Contact'.hardcode,
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
                        'constecon.lib.feature.contact.presentation.contact'
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
