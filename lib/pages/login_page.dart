import 'package:flutter/material.dart';
import 'package:vaicorinthians/features/login/controllers/login_controller.dart';
import 'package:vaicorinthians/pages/recover_page.dart';
import 'package:vaicorinthians/pages/shared/app_colors.dart';
import 'package:vaicorinthians/pages/shared/app_text_style.dart';
import 'package:vaicorinthians/pages/shared/widgets/app_checkbox_field.dart';
import 'package:vaicorinthians/pages/shared/widgets/app_elevated_button.dart';
import 'package:vaicorinthians/pages/shared/widgets/app_text_field.dart';
import 'package:vaicorinthians/pages/shared/widgets/politicas_termos.dart';
import 'package:vaicorinthians/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String route = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController = LoginController();

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height:
                MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top,

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Image.asset(
                      'assets/images/splash_screen.png',
                      width: 125,
                    ),
                  ),
                  Text('+DevsEcomm', style: AppTextStyle.title),
                  Spacer(flex: 2),
                  AppTextField(
                    errorText: loginController.emailError,
                    hintText: 'email@domínio.com',
                    onChanged: (value) {
                      setState(() {
                        loginController.setEmail(value);
                      });
                    },
                  ),
                  AppTextField(
                    errorText: loginController.senhaError,
                    hintText: '**********',
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        loginController.setSenha(value);
                      });
                    },
                  ),

                  AppCheckboxField(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => {
                        Navigator.pushNamed(context, RecoverPage.route),
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 25),
                        child: Text(
                          'Esqueci minha senha',
                          style: TextStyle(color: AppColors.black),
                        ),
                      ),
                    ),
                  ),
                  AppElevatedButton(
                    label: 'Entrar',
                    onPressed: loginController.isActiveButton ? () => {} : null,
                    type: ButtonType.filled,
                  ),
                  AppElevatedButton(
                    label: 'Cadastrar',
                    onPressed: () => {
                      Navigator.pushNamed(context, SignupPage.route),
                    },
                    type: ButtonType.outlined,
                  ),
                  Spacer(flex: 2),
                  PoliticasTermos(),
                  Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
