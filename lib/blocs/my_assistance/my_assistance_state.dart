part of 'my_assistance_bloc.dart';

sealed class MyAssistanceState extends Equatable {
  const MyAssistanceState();

  @override
  List<Object> get props => [];
}

final class MyAssistanceInitial extends MyAssistanceState {}

final class MyAssistanceCameraControllerLoaded extends MyAssistanceState {}

final class MyAssistancePictureTaken extends MyAssistanceState {
  final Uint8List picture;

  const MyAssistancePictureTaken(this.picture);

  @override
  List<Object> get props => [picture];
}

final class MyAssistanceSendingRequest extends MyAssistanceState {}

final class MyAssistanceRequestSent extends MyAssistanceState {}

final class MyAssistanceRequestFailed extends MyAssistanceState {}

final class MyAssistanceHistoryLoaded extends MyAssistanceState {
  final List<AssistanceReport> reports;

  const MyAssistanceHistoryLoaded(this.reports);

  @override
  List<Object> get props => [reports];
}

final class MyAssistanceHistoryEmpty extends MyAssistanceState {}
