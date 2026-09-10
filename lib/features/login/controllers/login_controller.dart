class LoginController {
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final RegExp _senhaRegex = RegExp(r'^.{6}$');
  bool isActiveCheckBox = false;
  String email = '';
  String senha = '';
  bool isActiveButton = false;

  bool get isEmailValid => _emailRegex.hasMatch(email.trim());
  bool get isSenhaValid => _senhaRegex.hasMatch(senha.trim());

  String? get emailError {
    if (email.trim().isEmpty) {
      return null;
    } else if (!_emailRegex.hasMatch(email.trim())) {
      return 'Email inválido';
    }
  }

  String? get senhaError {
    if (senha.trim().isEmpty) {
      return null;
    } else if (!_senhaRegex.hasMatch(senha.trim())) {
      return 'Senha inválida';
    }
  }

  void setEmail(String emailParam) {
    email = emailParam;
    changeActiveButton();
  }

  void setSenha(String senhaParam) {
    senha = senhaParam;
    changeActiveButton();
  }

  void changeActiveButton() {
    isActiveButton = isEmailValid && isSenhaValid;
  }

  void changeActiveCheckBox() {
    isActiveCheckBox = !isActiveCheckBox;
  }
}
