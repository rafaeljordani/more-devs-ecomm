import 'package:flutter/material.dart';
import 'package:vaicorinthians/pages/shared/app_colors.dart';

class PoliticasTermos extends StatelessWidget {
  const PoliticasTermos({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print('vai corinthians');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Termos de serviço ',
                style: TextStyle(color: AppColors.black),
              ),
              TextSpan(
                text: ' e ',
                style: TextStyle(color: const Color.fromARGB(255, 82, 77, 77)),
              ),
              TextSpan(
                text: ' Políticas de privacidade',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
