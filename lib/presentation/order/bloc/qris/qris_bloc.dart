import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos_bengkel/data/models/response/midtrans_check_status_qris_response_model.dart';
import 'package:pos_bengkel/data/models/response/midtrans_qris_response_model.dart';

import '../../../../data/datasources/midtrans_remote_datasource.dart';

part 'qris_event.dart';
part 'qris_state.dart';
part 'qris_bloc.freezed.dart';

class QrisBloc extends Bloc<QrisEvent, QrisState> {
  final MidtransRemoteDatasource midtransRemoteDatasource;
  QrisBloc(this.midtransRemoteDatasource) : super(const QrisState.initial()) {
    on<_GenerateQrCode>((event, emit) async {
      emit(const QrisState.loading());
      final response = await midtransRemoteDatasource.generateQRCode(event.orderId, event.grossAmount);
      emit(QrisState.qrisResponse(response));
    });

    on<_CheckPaymentStatus>((event, emit) async {
      try{
        final response = await midtransRemoteDatasource.checkStatus(event.orderId);
        if(response.transactionStatus == 'settlement'){
          emit(const QrisState.success("Transaksi Berhasil"));
        }
      }catch(error){
        emit(QrisState.error(error.toString()));
      }

    });
  }
}
