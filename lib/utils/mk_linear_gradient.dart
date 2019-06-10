import 'package:flutter/widgets.dart';
import 'package:voute/constants/mk_colors.dart';

class MkLinearGradient extends LinearGradient {
  const MkLinearGradient({
    bool inverse = false,
    Alignment begin = Alignment.topCenter,
    Alignment end = Alignment.bottomCenter,
  }) : super(
          begin: begin,
          end: end,
          colors: inverse
              ? const [
                  MkColors.gradient_end,
                  MkColors.gradient_start,
                ]
              : const [
                  MkColors.gradient_start,
                  MkColors.gradient_end,
                ],
        );

  const MkLinearGradient.reverse()
      : super(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: const [MkColors.gradient_end, MkColors.gradient_start],
        );

  const MkLinearGradient.accent()
      : super(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [MkColors.accent, MkColors.accent],
        );

  MkLinearGradient.light()
      : super(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            MkColors.gradient_start.withOpacity(.5),
            MkColors.gradient_start.withOpacity(.025),
          ],
        );
}
