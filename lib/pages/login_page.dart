import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:vaicorinthians/features/home/pages/home_page.dart';
import 'package:vaicorinthians/features/login/controllers/login_controller.dart';
import 'package:vaicorinthians/features/recover/pages/recover_page.dart';
import 'package:vaicorinthians/features/signup/pages/signup_page.dart';
import 'package:vaicorinthians/pages/shared/app_text_style.dart';
import 'package:vaicorinthians/pages/shared/widgets/app_elevated_button.dart';
import 'package:vaicorinthians/pages/shared/widgets/app_text_field.dart';
import 'package:vaicorinthians/shared/exceptions/auth_exception.dart';
import 'package:vaicorinthians/shared/widgets/app_check_box.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Safearea desconta espa  ços do disposito ex: barra superior
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Consumer<LoginController>(
                  builder: (context, controller, child) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Form(
                        key: controller.key,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: 32),

                            Image.asset('assets/images/logo.png', height: 120),

                            Center(
                              child: Text(
                                '+DevsEcomm',
                                style: AppTextStyle.title,
                              ),
                            ),
                            SizedBox(height: 48),
                            AppTextField(
                              controller: controller.emailController,
                              validator: (value) {
                                return controller.validateEmail(value);
                              },
                              hintText: 'email@dominio.com',
                            ),
                            SizedBox(height: 16),
                            AppTextField(
                              controller: controller.senhaController,
                              validator: (value) {
                                return controller.validateSenha(value);
                              },
                              hintText: '****************',
                              obscureText: true,
                            ),

                            Row(
                              children: [
                                AppCheckBox(
                                  value: controller.isActiveCheckBox,
                                  onChanged: (value) =>
                                      controller.changeActiveCheckBox(),
                                ),
                                Text('Lembrar-me'),
                              ],
                            ),
                            Align(
                              alignment: AlignmentGeometry.centerRight,
                              child: TextButton(
                                onPressed: () => {
                                  Navigator.pushNamed(
                                    context,
                                    RecoverPage.route,
                                  ),
                                },
                                child: Text(
                                  'Esqueci minha senha',
                                  style: AppTextStyle.title,
                                ),
                              ),
                            ),
                            AppElevatedButton(
                              label: 'Entrar',
                              isLoading: controller.isLoading,
                              onPressed: () async {
                                try {
                                  await controller.handleLogin();
                                  if (!context.mounted) return;
                                  Navigator.popAndPushNamed(
                                    context,
                                    HomePage.route,
                                  );
                                } on AuthException catch (e) {
                                  if (!context.mounted) return;
                                  AnimatedSnackBar.material(
                                    e.message,
                                    type: AnimatedSnackBarType.error,
                                    mobileSnackBarPosition:
                                        MobileSnackBarPosition.bottom,
                                  ).show(context);
                                }
                              },
                              type: ButtonType.filled,
                            ),
                            SizedBox(height: 12),
                            AppElevatedButton(
                              label: 'Cadastrar',
                              onPressed: () => {
                                Navigator.pushNamed(context, SignupPage.route),
                              },
                              type: ButtonType.outlined,
                            ),
                            SizedBox(height: 48),
                            //GestureDetector adiciona métodos de interação com usuario ex: onTap
                            GestureDetector(
                              onTap: () {
                                print('CLIQUEI NA LINHA');
                              },
                              //RichText - Aninhar textos e modificar seu alinhamento
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Termos de Serviço ',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: 'e ',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    TextSpan(
                                      text: 'Politicas de Privacidade',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 32),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
