part of 'financial_institute_bloc.dart';

abstract class FinancialInstituteEvent extends Equatable {
  const FinancialInstituteEvent();

  @override
  List<Object?> get props => [];
}

class LoadFinancialInstitutesEvent extends FinancialInstituteEvent {
  const LoadFinancialInstitutesEvent();
}

class LoadFinancialInstituteByIdEvent extends FinancialInstituteEvent {

  const LoadFinancialInstituteByIdEvent(this.id);
  final String id;

  @override
  List<Object?> get props => [id];
}

class LoadFinancialInstitutesByDealCountEvent extends FinancialInstituteEvent {
  const LoadFinancialInstitutesByDealCountEvent();
}

class LoadTopFinancialInstitutesByDealCountEvent extends FinancialInstituteEvent {
  const LoadTopFinancialInstitutesByDealCountEvent();
}

class LoadFinancialInstitutesByInvestmentCountEvent extends FinancialInstituteEvent {
  const LoadFinancialInstitutesByInvestmentCountEvent();
}