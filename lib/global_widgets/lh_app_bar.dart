import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/theme/app_colors.dart';

class LhAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget> actions;
  const LhAppBar({
    required this.actions,
    this.showBackButton = false,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: AppColors.rosaEscuro),
              onPressed: () => Navigator.of(context).pop(),
            )
          : const SizedBox.shrink(),
      title: Text(
        title,
        style: GoogleFonts.montserrat(color: AppColors.rosaEscuro),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
