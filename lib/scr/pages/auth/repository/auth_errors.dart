
import 'package:quitanda/scr/constants/texts_message_errors.dart';

String authErrorsString(String? code){
  switch ( code ) {
    case 'INVALID_CREDENTIALS':
      return tErrorInvalidCredentials;
    case 'Invalid session token':
      return tErrorInvalidCredentials;
    case 'INVALID_FULLNAME':
      return tErrorInvalidFullName;
    case 'INVALID_PHONE':
      return tErrorInvalidPhone;
    case 'INVALID_CPF':
      return tErrorInvalidCPF;
    default:
      return tErrorUndefined;
  }
}