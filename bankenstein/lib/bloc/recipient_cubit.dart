import 'package:bankenstein/models/recipient.dart';
import 'package:bankenstein/service/recipient_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class RecipientState {}

class RecipientStateInitial extends RecipientState {}

class RecipientStateLoading extends RecipientState {}

class RecipientStateLoaded extends RecipientState {
final List<RecipientModel> recipients;

RecipientStateLoaded({required this.recipients});

}

class RecipientStateError extends RecipientState {
  final String message;

  RecipientStateError({required this.message});
}

class RecipientCubit extends Cubit<RecipientState> {
  RecipientCubit() : super(RecipientStateInitial());

  Future<void> getRecipients() async {
    emit(RecipientStateLoading());
    try {
      final List<RecipientModel> recipients = await RecipientService.recipients();
      emit(RecipientStateLoaded(recipients: recipients));
    } catch (error) {
      emit (RecipientStateError(message : error.toString()));
    }


  }


}



