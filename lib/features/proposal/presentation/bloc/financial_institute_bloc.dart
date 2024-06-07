import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nexusdeep/features/proposal/domain/entity/fianancial_institute.dart';
import 'package:nexusdeep/features/proposal/domain/usecase/get_all_financial_institutes.dart';
import 'package:nexusdeep/features/proposal/domain/usecase/get_financial_institute_by_id.dart';
import 'package:nexusdeep/features/proposal/domain/usecase/get_financial_institutes_by_deal_count.dart';
import 'package:nexusdeep/features/proposal/domain/usecase/get_financial_institutes_by_investment_count.dart';
import 'package:nexusdeep/features/proposal/domain/usecase/get_top_financial_institutes_by_deal_count.dart';

part 'financial_institute_event.dart';
part 'financial_institute_state.dart';

class FinancialInstituteBloc
    extends Bloc<FinancialInstituteEvent, FinancialInstituteState> {

  FinancialInstituteBloc({
    required this.getAllFinancialInstitutes,
    required this.getFinancialInstituteById,
    required this.getFinancialInstitutesByDealCount,
    required this.getTopFinancialInstitutesByDealCount,
    required this.getFinancialInstitutesByInvestmentCount,
  }) : super(const FinancialInstituteInitial()) {
    on<LoadFinancialInstitutesEvent>(_onLoadFinancialInstitutes);
    on<LoadFinancialInstituteByIdEvent>(_onLoadFinancialInstituteById);
    on<LoadFinancialInstitutesByDealCountEvent>(
        _onLoadFinancialInstitutesByDealCount);
    on<LoadTopFinancialInstitutesByDealCountEvent>(
        _onLoadTopFinancialInstitutesByDealCount);
    on<LoadFinancialInstitutesByInvestmentCountEvent>(
        _onLoadFinancialInstitutesByInvestmentCount);
  }
  final GetAllFinancialInstitutes getAllFinancialInstitutes;
  final GetFinancialInstituteById getFinancialInstituteById;
  final GetFinancialInstitutesByDealCount getFinancialInstitutesByDealCount;
  final GetTopFinancialInstitutesByDealCount
      getTopFinancialInstitutesByDealCount;
  final GetFinancialInstitutesByInvestmentCount
      getFinancialInstitutesByInvestmentCount;

  Future<void> _onLoadFinancialInstitutes(LoadFinancialInstitutesEvent event,
      Emitter<FinancialInstituteState> emit) async {
    emit(const FinancialInstituteLoading());
    final result = await getAllFinancialInstitutes();
    result.fold(
      (failure) => emit(FinancialInstituteError(failure.message)),
      (institutes) => emit(FinancialInstitutesLoaded(institutes)),
    );
  }

  Future<void> _onLoadFinancialInstituteById(
      LoadFinancialInstituteByIdEvent event,
      Emitter<FinancialInstituteState> emit) async {
    emit(const FinancialInstituteLoading());
    final result = await getFinancialInstituteById(event.id);
    result.fold(
      (failure) => emit(FinancialInstituteError(failure.message)),
      (institute) => emit(FinancialInstituteLoaded(institute)),
    );
  }

  Future<void> _onLoadFinancialInstitutesByDealCount(
      LoadFinancialInstitutesByDealCountEvent event,
      Emitter<FinancialInstituteState> emit) async {
    emit(const FinancialInstituteLoading());
    final result = await getFinancialInstitutesByDealCount();
    result.fold(
      (failure) => emit(FinancialInstituteError(failure.message)),
      (institutes) => emit(FinancialInstitutesLoaded(institutes)),
    );
  }

  Future<void> _onLoadTopFinancialInstitutesByDealCount(
      LoadTopFinancialInstitutesByDealCountEvent event,
      Emitter<FinancialInstituteState> emit) async {
    emit(const FinancialInstituteLoading());
    final result = await getTopFinancialInstitutesByDealCount();
    result.fold(
      (failure) => emit(FinancialInstituteError(failure.message)),
      (institutes) => emit(FinancialInstitutesLoaded(institutes)),
    );
  }

  Future<void> _onLoadFinancialInstitutesByInvestmentCount(
      LoadFinancialInstitutesByInvestmentCountEvent event,
      Emitter<FinancialInstituteState> emit) async {
    emit(const FinancialInstituteLoading());
    final result = await getFinancialInstitutesByInvestmentCount();
    result.fold(
      (failure) => emit(FinancialInstituteError(failure.message)),
      (institutes) => emit(FinancialInstitutesLoaded(institutes)),
    );
  }
}
