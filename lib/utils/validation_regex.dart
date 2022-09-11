class ValidationRegExp {
  const ValidationRegExp._();

  static final login = RegExp(r"^(?=.*[a-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,40}$");
  static final password = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
}
