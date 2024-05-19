import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexusdeep/features/profile/domain/entity/liveliness.dart';
import 'package:nexusdeep/features/profile/domain/usecase/check_liveliness.dart';
import 'package:nexusdeep/features/profile/domain/usecase/get_user_facial_info.dart';

part 'liveliness_state.dart';

class LivelinessCubit extends Cubit<LivelinessState> {

  LivelinessCubit({required this.checkLiveliness, required this.getUserFacialInfo})
      : super(LivelinessInitial());
  final CheckLiveliness checkLiveliness;
  final GetUserFacialInfo getUserFacialInfo;

  Future<void> performLivelinessCheck(LivelinessParams params) async {
    emit(LivelinessLoading());
    final result = await checkLiveliness(params);
    result.fold(
          (failure) => emit(LivelinessFailure(failure.message)),
          (success) => emit(LivelinessSuccess(success)),
    );
  }

  Future<void> fetchUserFacialInfo(LivelinessParams params) async {
    emit(LivelinessLoading());
    final result = await getUserFacialInfo(params);
    result.fold(
          (failure) => emit(LivelinessFailure(failure.message)),
          (success) => emit(LivelinessSuccess(success)),
    );
  }
}