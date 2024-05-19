part of 'liveliness_cubit.dart';

abstract class LivelinessState extends Equatable {
  @override
  List<Object> get props => [];
}

class LivelinessInitial extends LivelinessState {}

class LivelinessLoading extends LivelinessState {}

class LivelinessSuccess extends LivelinessState {
  LivelinessSuccess(this.result);
  final bool result;

  @override
  List<Object> get props => [result];
}

class LivelinessFailure extends LivelinessState {
  LivelinessFailure(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}