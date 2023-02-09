
import 'package:quitanda/scr/constants/texts_message_errors.dart';

String authErrorsString(String? code){
  switch ( code ) {
    case 'INVALID_CREDENTIALS':
      return tErrorInvalidCredentials;
    default:
      return tErrorUndefined;
  }
}