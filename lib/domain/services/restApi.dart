import 'dart:convert';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../../config/config.dart';
import '../../config/enums.dart';
import '../models/restApiRespose.dart';
import '../repository/restApi.dart';

class RestApi implements RestApiRepository {
  // Singleton of this Class
  RestApi._privateConstructor();
  static final RestApi _instance = RestApi._privateConstructor();
  factory RestApi() => _instance;

  // Class variables
  String _apiKey = '';

  @override
  Future<RestApiResponse> apiCall(String route, Map<String, dynamic> params,
      dynamic body, RestApiMethod method) async {
    bool isJson = (method == RestApiMethod.post ||
            method == RestApiMethod.put ||
            method == RestApiMethod.patch)
        ? true
        : false;
    // Build uri for request
    final Uri uri = Uri.https(GlobalConfig.baseDomain, route, params);
    // Build http reqeust, add headers and body
    final http.Request httpRequest = http.Request(method.toString().split(".").last, uri)
      ..body = isJson ? json.encode(body) : (body ?? "")
      ..headers['Content-Type'] =
          isJson ? 'application/json' : 'application/x-www-form-urlencoded'
      ..headers['Accept'] = 'application/json'
      ..headers['Authorization'] = _apiKey;

    // Make the request
    try {
      final http.StreamedResponse response = await httpRequest.send();
      // Convert to response string
      String responseString = await response.stream.bytesToString();
      // Convert to response json object
      Map<String, dynamic> responseJson = jsonDecode(responseString);
      // Convert the response to a RestApiResponse
      return RestApiResponse.fromJson(responseJson);
    } catch (e) {
      // Print errors to console in debug mode
      if (kDebugMode) {
        print(e);
      }
      // Return error response
      return RestApiResponse(
          code: 500,
          message: kDebugMode ? e.toString() : "Request failed",
          success: false,
          payload: null,
          pagination: false);
    }
  }

  @override
  Future<RestApiResponse> get(String route, Map<String, dynamic> params) async {
    return apiCall(route, params, null, RestApiMethod.get);
  }

  @override
  Future<RestApiResponse> post(
      String route, Map<String, dynamic> params, body) async {
    return apiCall(route, params, body, RestApiMethod.post);
  }

  @override
  Future<RestApiResponse> patch(
      String route, Map<String, dynamic> params, body) async {
    return apiCall(route, params, body, RestApiMethod.patch);
  }

  @override
  Future<RestApiResponse> put(
      String route, Map<String, dynamic> params, body) async {
    return apiCall(route, params, body, RestApiMethod.put);
  }

  @override
  Future<RestApiResponse> delete(
      String route, Map<String, dynamic> params) async {
    return apiCall(route, params, null, RestApiMethod.delete);
  }

  @override
  Future<RestApiResponse> upload(String route, Map<String, dynamic> params, String filePath) async {
    // TODO implement upload
    throw UnimplementedError();
  }

  @override
  void setApiKey(String apiKey) {
    _apiKey = apiKey;
  }
}