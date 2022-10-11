
String? validateName(String? value) {
  if (value == null || value.isEmpty)
    return 'Enter a valid name';
  else
    return null;
}

String? validateLastName(String? value) {
  if (value == null || value.isEmpty)
    return 'Enter a valid Last Name';
  else
    return null;
}

String? validateDob(String? value) {
  if (value == null || value.isEmpty)
    return 'Enter your date of Birth';
  else
    return null;
}

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  pattern.length==0;
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value))
    return 'Enter a valid email address';
  else
    return null;
}

String? validatePhone(String? value) {
  String pattern =
  r"^[0-9]{10}$";

  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value))
    return 'Enter a valid Phone Number';
  else
    return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty||value.length<6)
    return 'Enter a valid password';
  else
    return null;
}

String? validateConfirmation(String? value) {
  if (value == null || value.isEmpty||value.length<6)
    return 'Password does\nt match';
  else
    return null;
}
