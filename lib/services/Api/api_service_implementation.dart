import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_call_outcome/flutter_call_outcome.dart';
import 'package:http/http.dart' as http;
import 'package:infi_devtest/buisness_logic/utils/api_constants.dart';
import 'package:infi_devtest/services/Api/api_service.dart';
import 'package:infi_devtest/services/service_locator.dart';

class ApiServiceImpl extends ApiService {
  final Map<String, String> header = {
    "Content-Type": "application/json",
  };

  @override
  Future<CallOutcome<Map<String, dynamic>>> postRequest(
    String apiName,
    Map<String, dynamic> postData, {
    bool isAuth = false,
  }) async {
    debugPrint(postData.toString());
    try {
      final result = await http.post(
        Uri.parse(ApiConstants.baseUrl + apiName),
        body: jsonEncode(postData),
        headers: header,
      );
      if (result.statusCode == 200) {
        return CallOutcome<Map<String, dynamic>>(
          data: jsonDecode(result.body) as Map<String, dynamic>,
        );
      } else {
        final String errorMessage = jsonDecode(result.body).toString();
        navigationService.showSnackBar(errorMessage);
        return CallOutcome<Map<String, dynamic>>(
          exception: Exception(errorMessage),
        );
      }
    } on Exception catch (e) {
      navigationService.showSnackBar('Something went wrong');
      return CallOutcome<Map<String, dynamic>>(exception: e);
    }
  }

  @override
  Future<CallOutcome<dynamic>> getRequest(String apiName) async {
    try {
      final result = await http.get(
        Uri.parse(ApiConstants.baseUrl + apiName),
        headers: header,
      );
      if (result.statusCode == 200) {
        return CallOutcome<dynamic>(
          data: jsonDecode(result.body),
        );
      } else {
        final String errorMessage = jsonDecode(result.body).toString();
        navigationService.showSnackBar(errorMessage);
        return CallOutcome<Map<String, dynamic>>(
          exception: Exception(errorMessage),
        );
      }
    } on Exception catch (e) {
      navigationService.showSnackBar('Something went wrong');
      return CallOutcome<Map<String, dynamic>>(exception: e);
    }
  }
}
