import 'package:nexusdeep/core/usecase/usecase.dart';
import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/proposal/domain/entity/fianancial_institute.dart';
import 'package:nexusdeep/features/proposal/domain/repos/financial_institution_repos.dart';

class GetFinancialInstituteById
    extends UsecaseWithParams<FinancialInstitute, String> {
  GetFinancialInstituteById(this.repository);
  final FinancialInstituteRepos repository;

  @override
  ResultFuture<FinancialInstitute> call(String id) {
    return repository.getFinancialInstituteById(id);
  }
}
