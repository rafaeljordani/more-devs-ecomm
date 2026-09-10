import 'package:flutter/material.dart';
import 'package:vaicorinthians/pages/shared/app_colors.dart';
import 'package:vaicorinthians/pages/shared/app_text_style.dart';

class AppRequiredPassword extends StatelessWidget {
  const AppRequiredPassword({
    super.key,
    required this.atendido,
    required this.text,
  });

  final bool atendido;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          atendido ? Icons.check_circle : Icons.check_circle_outline,
          color: atendido ? AppColors.green : AppColors.grey,
        ),
        SizedBox(width: 20),
        Text(
          text,
          style: atendido ? AppTextStyle.buttonLabel : AppTextStyle.title,
        ),
      ],
    );
  }
}
