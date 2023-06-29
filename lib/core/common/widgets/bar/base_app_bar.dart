import 'package:flutter/material.dart';

import '../../../generator/assets.gen.dart';
import '../../../generator/colors.gen.dart';
import '../../../utils/extensions.dart';
import '../../../utils/styles.dart';
import '../layout/adaptive/adaptive_layout.dart';

class BaseAppBar extends PreferredSize {
  const BaseAppBar({
    super.key,
    super.preferredSize = const Size.fromHeight(77),
    super.child = const SizedBox(),
  });
  @override
  Widget get child => Adaptive(
        builder: (t) => AppBar(
          toolbarHeight: 77,
          leadingWidth: t.when(onWeb: 220, onMobile: null),
          leading: _Leading(t: t),
          backgroundColor: AppColors.white,
          centerTitle: true,
          title: Assets.icon.logo.svg(),
          actions: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'EN',
                  style: AppTextStyle.normal.cp(
                    color: AppColors.rainbow.withOpacity(.15),
                    fontSize: 16,
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
                  'VN',
                  style: AppTextStyle.normal.cp(
                    color: AppColors.rainbow,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                20.horizontal,
              ],
            ),
          ],
          elevation: 8,
          shadowColor: AppColors.black.withOpacity(.2),
        ),
      );
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
                  fontSize: 16,
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
