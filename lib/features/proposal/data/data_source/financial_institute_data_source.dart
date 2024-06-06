import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nexusdeep/core/errors/exceptions.dart';
import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/proposal/data/model/financial_institute_model.dart';

abstract class FinancialInstituteDataSource {
  Future<FinancialInstituteModel> getFinancialInstituteById(String id);
  Future<List<FinancialInstituteModel>> getAllFinancialInstitutes();
  Future<List<FinancialInstituteModel>> getFinancialInstitutesByDealCount();
  Future<List<FinancialInstituteModel>> getFinancialInstitutesByInvestmentCount();
  Future<List<FinancialInstituteModel>> getTopFinancialInstitutesByDealCount();
}

class FinancialInstituteDataSourceImpl implements FinancialInstituteDataSource {
  final http.Client client;

  FinancialInstituteDataSourceImpl({required this.client});

  @override
  Future<FinancialInstituteModel> getFinancialInstituteById(String id) async {
    final response = await client.get(Uri.parse('https://api.yourdomain.com/financial_institutes/$id'));
    if (response.statusCode == 200) {
      return FinancialInstituteModel.fromMap(json.decode(response.body) as DataMap);
    } else {
      throw ServerException(message: 'Failed to fetch data', statusCode: response.statusCode.toString());
    }
  }

  @override
  Future<List<FinancialInstituteModel>> getAllFinancialInstitutes() async {
    final response = await client.get(Uri.parse('https://api.yourdomain.com/financial_institutes'));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => FinancialInstituteModel.fromMap(data as DataMap))
          .toList();
    } else {
      throw ServerException(message: 'Failed to fetch data', statusCode: response.statusCode.toString());
    }
  }

// Implement other methods similarly...
}