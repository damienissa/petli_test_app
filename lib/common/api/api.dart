import 'package:http/http.dart' as http;
import 'package:petli_test_app/common/constants/api_constants.dart';

class API {
  Future<http.Response> loadImagesList() async =>
      http.get(Uri.parse(APIConstants.baseURL + APIConstants.photosPath));
}

class BackendError extends Error {
  final String message;

  BackendError(this.message);

  @override
  String toString() {
    return 'BackendError: $message';
  }
}
