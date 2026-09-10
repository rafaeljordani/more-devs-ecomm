class RecoverController {
  String email = '';
  bool isActiveButton = false;
  final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  bool get isEmailValid => _emailRegex.hasMatch(email.trim());

  void setEmail(String emailParam) {
    email = emailParam;
    changeActiveButton();
  }

  void changeActiveButton() {
    isActiveButton = isEmailValid;
  }
}
