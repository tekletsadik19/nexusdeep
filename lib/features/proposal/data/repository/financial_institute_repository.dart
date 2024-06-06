import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/proposal/data/data_source/financial_institute_data_source.dart';
import 'package:nexusdeep/features/proposal/domain/entity/fianancial_institute.dart';
import 'package:nexusdeep/features/proposal/domain/repos/financial_institution_repos.dart';

class FinancialInstituteRepoImpl implements FinancialInstituteRepos {

  FinancialInstituteRepoImpl(this.dataSource);
  final FinancialInstituteDataSource dataSource;

  @override
  ResultFuture<FinancialInstitute> getFinancialInstituteById(String id) {
    return dataSource.getFinancialInstituteById(id);
  }

  @override
  ResultFuture<List<FinancialInstitute>> getFinancialInstitutesByInvestmentCount() {
    return dataSource.getFinancialInstitutesByInvestmentCount();
  }

  @override
  ResultFuture<List<FinancialInstitute>> getAllFinancialInstitutes() {
    return dataSource.getAllFinancialInstitutes();
  }

  @override
  ResultFuture<List<FinancialInstitute>> getTopFinancialInstitutesByDealCount() {
    return dataSource.getTopFinancialInstitutesByDealCount();
  }

  @override
  ResultFuture<List<FinancialInstitute>> getFinancialInstitutesByDealCount() {
    return dataSource.getFinancialInstitutesByDealCount();
  }
}
