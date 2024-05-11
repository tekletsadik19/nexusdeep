import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexusdeep/features/profile/domain/entity/scan_result.dart';
import 'package:nexusdeep/features/profile/domain/usecase/scan_digital_id.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required this.scanDigitalId})
      : super(ProfileInitial()) {
    on<ScanDigitalIdEvent>((event, emit) async {
      emit(ProfileLoading());
      final result = await scanDigitalId(
        ScanResultParams(
          front: event.front,
          back: event.back,
        ),
      );
      result.fold(
        (failure) => emit(ProfileError(failure.message)),
        (scanResult) => emit(ProfileScanSuccess(scanResult)),
      );
    });

    on<ScanPassportEvent>((event, emit) async {
      emit(ProfileLoading());
      final result = await scanDigitalId(
        ScanResultParams(
          firstPage: event.firstPage,
        ),
      );
      result.fold(
        (failure) => emit(ProfileError(failure.message)),
        (scanResult) => emit(ProfileScanSuccess(scanResult)),
      );
    });
  }
  final ScanDigitalId scanDigitalId;
}
