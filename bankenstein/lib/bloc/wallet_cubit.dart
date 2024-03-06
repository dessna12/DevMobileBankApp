import 'package:bankenstein/models/wallet.dart';
import 'package:bankenstein/service/wallet_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class WalletState {}

class WalletStateInitial extends WalletState {}

class WalletStateLoading extends WalletState {}

class WalletStateLoaded extends WalletState {
  WalletStateLoaded({required this.wallet});

  final List<WalletModel> wallet;
}

class WalletStateError extends WalletState {
  WalletStateError({required this.message});

  final String message;
}

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletStateInitial());

  Future<void> getWallet() async {
    emit(WalletStateLoading());
    try {
      final wallet = await WalletService.getWallet();
      emit(WalletStateLoaded(wallet: wallet));
    } catch (e) {
      emit(WalletStateError(message: e.toString()));
    }
  }
}
