import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/theme/app_colors.dart';

class LhPrimaryButton extends StatelessWidget {
  const LhPrimaryButton({
    super.key,
    this.formKey,
    this.onPressed,
    required this.label,
  });

  final GlobalKey<FormState>? formKey;
  final void Function()? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey != null) {
          if (formKey!.currentState!.validate()) {
            if (onPressed != null) onPressed!();
          }
        } else if (onPressed != null) {
          onPressed!();
        }
      },
      style: ElevatedButton.styleFrom(
        primary: AppColors.rosaEscuro,
        onPrimary: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20),
        textStyle: GoogleFonts.montserrat(fontSize: 20),
      ),
      child: Text(label),
    );
  }
}
