part of 'qris_bloc.dart';

@freezed
class QrisState with _$QrisState {
  const factory QrisState.initial() = _Initial;
  const factory QrisState.loading() = _Loading;
  const factory QrisState.qrisResponse(MidtransQrisResponse qrisResponse) = _QrisResponse;
  const factory QrisState.checkStatus(MidtransCheckStatusQrisResponse checkStatusQrisResponse) = _CheckStatusQris;
  const factory QrisState.success(String message) = _Success;
  const factory QrisState.error(String error) = _Error;
}
