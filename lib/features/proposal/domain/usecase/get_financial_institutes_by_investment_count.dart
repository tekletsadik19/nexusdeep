import 'package:nexusdeep/core/usecase/usecase.dart';
import 'package:nexusdeep/core/utils/typedef.dart';

import 'package:nexusdeep/features/proposal/domain/entity/fianancial_institute.dart';
import 'package:nexusdeep/features/proposal/domain/repos/financial_institution_repos.dart';

class GetFinancialInstitutesByInvestmentCount
    extends UsecaseWithoutParams<List<FinancialInstitute>> {
  GetFinancialInstitutesByInvestmentCount(this.repository);
  final FinancialInstituteRepos repository;

  @override
  ResultFuture<List<FinancialInstitute>> call() {
    return repository.getFinancialInstitutesByInvestmentCount();
  }
}
