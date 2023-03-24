import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class LhSecondaryButton extends StatelessWidget {
  final Widget child;
  final double? minWidth;
  final bool? hideBorder;
  final VoidCallback? onPressed;

  const LhSecondaryButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.hideBorder,
    this.minWidth,
  }) : super(key: key);

  factory LhSecondaryButton.icon({
    Key? key,
    required Widget icon,
    required Widget label,
    required VoidCallback? onPressed,
  }) =>
      LhSecondaryButton(
        key: key,
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(width: 8),
            label,
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final enabled = onPressed != null;

    final foregroundColor = enabled ? theme.colorScheme.primary : AppColors.blackDisabled;
    final textStyle = theme.textTheme.button!.copyWith(
      color: enabled ? theme.colorScheme.primary : const Color.fromARGB(87, 164, 168, 175),
    );

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 50),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: enabled ? theme.colorScheme.surface : Color.alphaBlend(AppColors.whiteHighEmphashis, theme.colorScheme.background),
          border: hideBorder == true ? null : Border.all(color: enabled ? foregroundColor : const Color.fromARGB(87, 164, 168, 175)),
          borderRadius: BorderRadius.circular(30),
        ),
        child: MaterialButton(
          minWidth: minWidth,
          animationDuration: const Duration(seconds: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          elevation: 0,
          highlightColor: Colors.transparent,
          onPressed: onPressed,
          splashColor: theme.colorScheme.primary.withOpacity(0.20),
          disabledColor: hideBorder == true ? Colors.transparent : AppColors.blackDisabled,
          disabledTextColor: AppColors.whiteDisabled,
          child: IconTheme.merge(
            data: const IconThemeData(color: Colors.white, size: 24),
            child: DefaultTextStyle.merge(
              child: child,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
