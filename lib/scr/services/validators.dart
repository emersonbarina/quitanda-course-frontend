import 'package:get/get.dart';

import '../constants/texts.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return tValidEmailEmpty;
  }
  if (!email.isEmail) return tValidEmail;
  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return tValidPassEmpty;
  }
  if (password.length < 7) return tValidPassLength;
  return null;
}

String? nameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return tValidName;
  }
  final names = name.split(' ');
  if (names.length == 1) return tValidNameComplete;
  return null;
}

String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) {
    return tValidPhone;
  }
  if (phone.length < 14 || !phone.isPhoneNumber) {
    return tValidPhoneCorrect;
  }
  return null;
}

String? cpfValidator(String? cpf) {
  if (cpf == null || cpf.isEmpty) {
    return tValidCPF;
  }
  if (!cpf.isCpf) return tValidCPF;
  return null;
}
