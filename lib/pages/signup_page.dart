import 'package:flutter/material.dart';
import 'package:vaicorinthians/features/signup/controllers/signup_controller.dart';
import 'package:vaicorinthians/pages/shared/app_text_style.dart';
import 'package:vaicorinthians/pages/shared/widgets/app_elevated_button.dart';
import 'package:vaicorinthians/pages/shared/widgets/app_password_validation.dart';
import 'package:vaicorinthians/pages/shared/widgets/app_text_field.dart';
import 'package:vaicorinthians/pages/shared/widgets/politicas_termos.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  static String route = '/signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  SignupController signupController = SignupController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Text('Cadastro', style: AppTextStyle.title),
              Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                child: AppTextField(
                  hintText: 'Nome de usuário',
                  onChanged: (value) {
                    setState(() {
                      signupController.setNome(value);
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                child: AppTextField(
                  hintText: 'email@domínio.com',
                  onChanged: (value) {
                    setState(() {
                      signupController.setEmail(value);
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                child: AppTextField(
                  hintText: 'Senha',
                  onChanged: (value) {
                    setState(() {
                      signupController.setSenha(value);
                    });
                  },
                  obscureText: true,
                ),
              ),
              AppTextField(
                hintText: 'Confirme a senha',
                onChanged: (value) {
                  setState(() {
                    signupController.setConfirmPW(value);
                  });
                },
                obscureText: true,
              ),

              AppPasswordValidation(
                label: 'Mínimo de seis caracteres',
                isValid: signupController.passwordLenghtValid,
              ),
              AppPasswordValidation(
                label: 'Mínimo de uma letra maíscula',
                isValid: signupController.passwordLetraMaiusculaIsValid,
              ),
              AppPasswordValidation(
                label: 'Mínimo de uma letra minúscula',
                isValid: signupController.passwordLetraMinusculaIsValid,
              ),
              AppPasswordValidation(
                label: 'Mínimo de um caracter especial',
                isValid: signupController.passwordEspecialIsValid,
              ),
              AppPasswordValidation(
                label: 'As senhas conferem',
                isValid: signupController.confirmarSenhaIsValid,
              ),

              Spacer(),

              AppElevatedButton(
                label: 'Continuar',
                isLoading: signupController.isLoading,
                onPressed: signupController.isActiveButton
                    ? () async {
                        setState(() {
                          signupController.isLoading = true;
                        });

                        await signupController.signUp();

                        setState(() {
                          signupController.isLoading = false;
                        });
                      }
                    : null,
                type: ButtonType.filled,
              ),
              Spacer(flex: 2),
              PoliticasTermos(),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
