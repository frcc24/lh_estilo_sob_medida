import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/theme/app_colors.dart';

class LhTextFormField extends StatelessWidget {
  final String label;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool obscureText;
  final TextEditingController? controller;

  const LhTextFormField({
    Key? key,
    required this.label,
    this.controller,
    this.validator,
    this.onChanged,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        style: GoogleFonts.montserrat(
          color: AppColors.rosaEscuro,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          labelStyle: const TextStyle(color: AppColors.rosaEscuro),
          labelText: label,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.rosaClaro),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.rosaEscuro),
          ),
        ),
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
