import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:nexusdeep/core/common/app/providers/user_session.dart';
import 'package:nexusdeep/core/errors/exceptions.dart';
import 'package:nexusdeep/core/services/config.dart';
import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/proposal/data/model/financial_institute_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FinancialInstituteDataSource {
  Future<FinancialInstituteModel> getFinancialInstituteById(String id);
  Future<List<FinancialInstituteModel>> getAllFinancialInstitutes();
  Future<List<FinancialInstituteModel>> getFinancialInstitutesByDealCount();
  Future<List<FinancialInstituteModel>>
      getFinancialInstitutesByInvestmentCount();
  Future<List<FinancialInstituteModel>> getTopFinancialInstitutesByDealCount();
}

class FinancialInstituteDataSourceImpl implements FinancialInstituteDataSource {
  FinancialInstituteDataSourceImpl({
    required SharedPreferences prefs,
    required UserSession userSession,
  })  : _userSession = userSession,
        _prefs = prefs;

  final Client client = Client();
  final UserSession _userSession;
  final SharedPreferences _prefs;

  Future<Map<String, String>> _getHeaders() async {
    final newAccessToken = await _userSession.refreshToken();

    final requestHeaders = <String, String>{
      'Authorization': 'Bearer $newAccessToken',
    };

    return requestHeaders;
  }

  @override
  Future<FinancialInstituteModel> getFinancialInstituteById(String id) async {
    final headers = await _getHeaders();

    final response = await client.get(
      Uri.parse('${Config.apiUrl}${Config.getFinancialInstituteByIdUrl}/$id'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return FinancialInstituteModel.fromMap(
          json.decode(response.body) as DataMap);
    } else {
      throw ServerException(
          message: 'Failed to fetch data',
          statusCode: response.statusCode.toString());
    }
  }

  @override
  Future<List<FinancialInstituteModel>> getAllFinancialInstitutes() async {
    final headers = await _getHeaders();
    if (kDebugMode) {
      print(headers);
    }
    final response = await client.get(
      Uri.parse('${Config.apiUrl}${Config.getAllFinancialInstitutesUrl}'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => FinancialInstituteModel.fromMap(data as DataMap))
          .toList();
    } else {
      throw ServerException(
          message: 'Failed to fetch data',
          statusCode: response.statusCode.toString());
    }
  }

  @override
  Future<List<FinancialInstituteModel>>
      getFinancialInstitutesByInvestmentCount() async {
    final headers = await _getHeaders();

    final url = Uri.https(
        Config.apiUrl, Config.getFinancialInstitutesByInvestmentCountUrl);
    final response = await client.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => FinancialInstituteModel.fromMap(data as DataMap))
          .toList();
    } else {
      throw ServerException(
          message: 'Failed to fetch data',
          statusCode: response.statusCode.toString());
    }
  }

  @override
  Future<List<FinancialInstituteModel>>
      getFinancialInstitutesByDealCount() async {
    final headers = await _getHeaders();
    final response = await client.get(
      Uri.parse(
          '${Config.apiUrl}${Config.getFinancialInstitutesByDealCountUrl}'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => FinancialInstituteModel.fromMap(data as DataMap))
          .toList();
    } else {
      throw ServerException(
          message: 'Failed to fetch data',
          statusCode: response.statusCode.toString());
    }
  }

  @override
  Future<List<FinancialInstituteModel>>
      getTopFinancialInstitutesByDealCount() async {
    final accessToken = await _userSession.refreshToken();

    final requestHeaders = <String, String>{
      'Authorization': 'Bearer $accessToken',
    };

    final url = Uri.https(
      Config.apiUrl,
      Config.getTopFinancialInstitutesByDealCountUrl,
    );
    final response = await client.get(
      url,
      headers: requestHeaders,
    );
    if (response.statusCode == 201) {
      var responseData = json.decode(response.body);

      if(kDebugMode){
        print(responseData['financialInstitutes']);
      }
      if (responseData is Map) {
        responseData = responseData['financialInstitutes'];
      }
      return (responseData as List)
          .map((data) =>
              FinancialInstituteModel.fromMap(data as Map<String, dynamic>))
          .toList();
    } else {
      throw ServerException(
        message: 'Failed to fetch data',
        statusCode: response.statusCode.toString(),
      );
    }
  }
}
