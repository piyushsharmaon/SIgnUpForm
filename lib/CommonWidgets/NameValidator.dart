String? validateName(String? value) {

  RegExp regex = RegExp('!@#<>?":_``~;[]\|=-+)(*&^%1234567890');
  if (value == null || value.isEmpty || !regex.hasMatch(value))
    return 'Enter a valid email address';
  else
    return null;
}