import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zyntra/features/asky_ai/domain/entities/message_entity.dart';
import 'package:zyntra/features/asky_ai/domain/use_cases/get_all_messages_use_case.dart';

part 'get_messages_state.dart';

class GetMessagesCubit extends Cubit<GetMessagesState> {
  final GetAllMessagesUseCase useCase;

  List<MessageEntity> messages = [];

  GetMessagesCubit({required this.useCase}) : super(GetMessagesInitial());

  Future<void> getMessages() async {
    emit(GetMessagesLoading());

    final result = await useCase.call();

    result.fold(
      (failure) => emit(GetMessagesFailure(message: failure.message)),
      (messages) {
        this.messages = messages;
        emit(GetMessagesSuccess(messages: messages));
      },
    );
  }

  void addMessage(MessageEntity message) {
    messages.add(message);
    emit(GetMessagesInitial());
    emit(GetMessagesSuccess(messages: messages));
  }
}
