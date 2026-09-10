import 'package:flutter/material.dart';
import 'package:vaicorinthians/pages/shared/app_colors.dart';

class AppPasswordValidation extends StatelessWidget {
  const AppPasswordValidation({
    super.key,
    required this.label,
    required this.isValid,
  });

  final String label;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
            child: Icon(
              Icons.check_circle,
              color: isValid ? AppColors.darkGreen : AppColors.black,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: isValid ? AppColors.darkGreen : AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
