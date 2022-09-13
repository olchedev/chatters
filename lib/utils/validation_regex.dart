class ValidationRegExp {
  const ValidationRegExp._();

  static final login =
      RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
  static final password = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
  static final name = RegExp(r"^.{1,35}$");
}
