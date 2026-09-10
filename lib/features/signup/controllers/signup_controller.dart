class SignupController {
  bool isActiveCheckBox = false;
  String email = '';
  String senha = '';
  String nome = '';
  String confirmarSenha = '';
  bool isActiveButton = false;
  bool isLoading = false;
  final _passwordLenght = 6;
  final RegExp _passwordLetraMaiscula = RegExp(r'[A-Z]');
  final RegExp _passwordLetraMinuscula = RegExp(r'[a-z]');
  final RegExp _passwordEspecial = RegExp(r'[!@#$%^&*(),.?":{}|<>_\-]');
  final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  Future<void> signUp() async {
    await Future.delayed(Duration(seconds: 2));
  }

  bool get passwordLenghtValid => senha.length >= _passwordLenght;

  bool get passwordLetraMaiusculaIsValid =>
      _passwordLetraMaiscula.hasMatch(senha.trim());

  bool get passwordLetraMinusculaIsValid =>
      _passwordLetraMinuscula.hasMatch(senha.trim());

  bool get passwordEspecialIsValid => _passwordEspecial.hasMatch(senha.trim());

  bool get confirmarSenhaIsValid =>
      (confirmarSenha == senha && confirmarSenha.isNotEmpty);

  bool get camposSenhaIsValid =>
      passwordEspecialIsValid &&
      passwordLenghtValid &&
      passwordLetraMaiusculaIsValid &&
      passwordLetraMinusculaIsValid;

  bool get isEmailValid => _emailRegex.hasMatch(email.trim());

  void setEmail(String emailParam) {
    email = emailParam;
    changeActiveButton();
  }

  void setSenha(String senhaParam) {
    senha = senhaParam;
    changeActiveButton();
  }

  void setNome(String nomeParam) {
    nome = nomeParam;
    changeActiveButton();
  }

  void setConfirmPW(String confirmPW) {
    confirmarSenha = confirmPW;
    changeActiveButton();
  }

  void changeActiveButton() {
    isActiveButton =
        isEmailValid &&
        camposSenhaIsValid &&
        nome.trim().isNotEmpty &&
        confirmarSenha.trim().isNotEmpty;
  }

  void changeActiveCheckBox() {
    isActiveCheckBox = !isActiveCheckBox;
  }
}
