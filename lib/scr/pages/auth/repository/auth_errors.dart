
import 'package:quitanda/scr/constants/texts_message_errors.dart';

String authErrorsString(String? code){
  switch ( code ) {
    case 'INVALID_CREDENTIALS':
      return tErrorInvalidCredentials;
    case 'Invalid session token':
      return tErrorInvalidCredentials;
    default:
      return tErrorUndefined;
  }
}