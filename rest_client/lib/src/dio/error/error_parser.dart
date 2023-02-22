
import '../../../flutter_rest_client.dart';

class ErrorParser {
  static String parseDioException(dynamic error) {
    final dioException = NetworkException.getDioException(error);
    return NetworkException.getErrorMessage(dioException);
  }
}
