import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/proposal/domain/entity/fianancial_institute.dart';

abstract class FinancialInstituteRepos {
  const FinancialInstituteRepos();

  ResultFuture<FinancialInstitute> getFinancialInstituteById(String id);
  ResultFuture<List<FinancialInstitute>>
      getFinancialInstitutesByInvestmentCount();
  ResultFuture<List<FinancialInstitute>> getAllFinancialInstitutes();
  ResultFuture<List<FinancialInstitute>> getTopFinancialInstitutesByDealCount();
  ResultFuture<List<FinancialInstitute>> getFinancialInstitutesByDealCount();
}
