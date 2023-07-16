import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../../generator/assets.gen.dart';
import '../../../../utils/extensions.dart';
import '../../../../utils/styles.dart';
import '../adaptive/adaptive_layout.dart';

enum LayoutCard {
  left,
  right,
  none,
}

extension LayoutCardX on LayoutCard {
  bool get isLeft => this == LayoutCard.left;
  bool get isRight => this == LayoutCard.right;
}

class CardX extends StatelessWidget {
  const CardX({
    super.key,
    required this.t,
    required this.c,
    this.layoutCard = LayoutCard.left,
    required this.child,
    this.callback,
  });
  final XLayout t;
  final BoxConstraints c;
  final LayoutCard layoutCard;
  final List<Widget> child;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: t.when(onWeb: 40, onMobile: 10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              if (layoutCard.isLeft)
                t
                    .when(
                      onMobile: 0,
                      onWeb: c.maxWidth / 2,
                    )
                    .horizontal,
              Expanded(
                child: Text(
                  'Title',
                  style: AppTextStyle.normal,
                ),
              ),
              if (layoutCard.isRight)
                t
                    .when(
                      onMobile: 0,
                      onWeb: c.maxWidth / 2,
                    )
                    .horizontal,
            ],
          ),
          2.horizontalLine(context),
          Row(
            children: [
              if (layoutCard.isLeft)
                t
                    .when(
                      onMobile: 0,
                      onWeb: c.maxWidth / 2,
                    )
                    .horizontal,
              Expanded(
                child: t.whenGrid(
                  value: child,
                  onWeb: (v) => Column(
                    children: v
                        .slices(2)
                        .map(
                          (e) => Row(
                            children: [
                              for (final ee in e)
                                Expanded(
                                  child: ee,
                                )
                            ],
                          ),
                        )
                        .toList(),
                  ),
                  onMobile: (v) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: v,
                  ),
                ),
              ),
              if (layoutCard.isRight)
                t
                    .when(
                      onMobile: 0,
                      onWeb: c.maxWidth / 2,
                    )
                    .horizontal,
            ],
          ),
          if (callback != null)
            Row(
              children: [
                if (layoutCard.isLeft)
                  t
                      .when(
                        onMobile: 0,
                        onWeb: c.maxWidth / 2,
                      )
                      .horizontal,
                Expanded(
                  child: Row(
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: callback,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'READ MORE'.hardcode,
                                  style: AppTextStyle.normal,
                                ),
                                6.horizontal,
                                Assets.icon.icMore.svg(
                                  width: 16,
                                  height: 16,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (layoutCard.isRight)
                  t
                      .when(
                        onMobile: 0,
                        onWeb: c.maxWidth / 2,
                      )
                      .horizontal,
              ],
            )
        ],
      ),
    );
  }
}
