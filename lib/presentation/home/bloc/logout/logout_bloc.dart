import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/auth_remote_datasource.dart';

part 'logout_event.dart';

part 'logout_state.dart';

part 'logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRemoteDatasource _authRemoteDataSource;

  LogoutBloc(this._authRemoteDataSource) : super(const LogoutState.initial()) {
    on<_logout>((event, emit) async {
      emit(const LogoutState.loading());
      final result = await _authRemoteDataSource.logout();
      result.fold(
        (l) => emit(LogoutState.error(l)),
        (r) => emit(const LogoutState.success()),
      );
    });
  }
}
