part of 'financial_institute_bloc.dart';

abstract class FinancialInstituteState extends Equatable {
  const FinancialInstituteState();

  @override
  List<Object> get props => [];
}

class FinancialInstituteInitial extends FinancialInstituteState {
  const FinancialInstituteInitial();
}

class FinancialInstituteLoading extends FinancialInstituteState {
  const FinancialInstituteLoading();
}

class FinancialInstitutesLoaded extends FinancialInstituteState {

  const FinancialInstitutesLoaded(this.institutes);
  final List<FinancialInstitute> institutes;

  @override
  List<Object> get props => [institutes];
}

class FinancialInstituteLoaded extends FinancialInstituteState {

  const FinancialInstituteLoaded(this.institute);
  final FinancialInstitute institute;

  @override
  List<Object> get props => [institute];
}

class FinancialInstituteError extends FinancialInstituteState {

  const FinancialInstituteError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}