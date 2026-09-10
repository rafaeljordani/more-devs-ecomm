import 'package:flutter/material.dart';
import 'package:vaicorinthians/pages/shared/app_colors.dart';

class AppCheckboxField extends StatefulWidget {
  const AppCheckboxField({super.key});

  @override
  State<AppCheckboxField> createState() => _AppCheckboxField();
}

class _AppCheckboxField extends State<AppCheckboxField> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (bool? newValue) {
            setState(() {
              _isChecked = newValue ?? false;
            });
          },
        ),
        Text(
          'Lembrar de mim',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
