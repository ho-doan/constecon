import 'package:flutter/material.dart';

import '../../../generator/assets.gen.dart';
import '../../../generator/colors.gen.dart';
import '../layout/adaptive/adaptive_layout.dart';

enum IconButtonType {
  left,
  right,
}

extension IconButtonTypeX on IconButtonType {
  bool get isLeft => this == IconButtonType.left;
}

class IconButtonBase extends StatelessWidget {
  const IconButtonBase({
    super.key,
    this.type = IconButtonType.left,
    required this.callback,
    required this.t,
  });
  final IconButtonType type;
  final VoidCallback callback;
  final XLayout t;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Stack(
        children: [
          if (type.isLeft)
            Assets.icon.backBg.svg(
              width: t.when(onWeb: 60, onMobile: 40),
              height: t.when(onWeb: 60, onMobile: 40),
              colorFilter: const ColorFilter.mode(
                AppColors.mediumTurquoise,
                BlendMode.srcIn,
              ),
            )
          else
            Assets.icon.nextBg.svg(
              width: t.when(onWeb: 60, onMobile: 40),
              height: t.when(onWeb: 60, onMobile: 40),
              colorFilter: const ColorFilter.mode(
                AppColors.ceruleanBlue,
                BlendMode.srcIn,
              ),
            ),
          Positioned.fill(
            child: Center(
              child: type.isLeft
                  ? Assets.icon.back.svg(
                      colorFilter: const ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                    )
                  : Assets.icon.next.svg(),
            ),
          ),
        ],
      ),
    );
  }
}
