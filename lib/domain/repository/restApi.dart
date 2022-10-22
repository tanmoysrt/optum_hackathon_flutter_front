import '../../config/enums.dart';
import '../models/restApiRespose.dart';

/// RestApi Repository
/// This class is responsible for making the API calls to the server.
/// Also handle the API key to store and retrieve from storage
abstract class RestApiRepository {
  Future<RestApiResponse> apiCall(String route, Map<String, dynamic> params, dynamic body, RestApiMethod method);
  Future<RestApiResponse> get(String route, Map<String, dynamic> params);
  Future<RestApiResponse> post(String route, Map<String, dynamic> params, dynamic body);
  Future<RestApiResponse> put(String route, Map<String, dynamic> params, dynamic body);
  Future<RestApiResponse> patch(String route, Map<String, dynamic> params, dynamic body);
  Future<RestApiResponse> delete(String route, Map<String, dynamic> params); 
  Future<RestApiResponse> upload(String route, Map<String, dynamic> params, String filePath);
  void setApiKey(String apiKey);
}