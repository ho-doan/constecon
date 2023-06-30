import 'package:flutter/material.dart';

import '../../../generator/assets.gen.dart';
import '../../../generator/colors.gen.dart';

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
  });
  final IconButtonType type;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Stack(children: [
        if (type.isLeft)
          Assets.icon.backBg.svg(
            width: 60,
            height: 60,
            colorFilter: const ColorFilter.mode(
              AppColors.mediumTurquoise,
              BlendMode.srcIn,
            ),
          )
        else
          Assets.icon.nextBg.svg(
            width: 60,
            height: 60,
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
        ))
      ]),
    );
  }
}
