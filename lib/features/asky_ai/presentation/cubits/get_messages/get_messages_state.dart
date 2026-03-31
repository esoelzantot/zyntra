part of 'get_messages_cubit.dart';

sealed class GetMessagesState {}

class GetMessagesInitial extends GetMessagesState {}

class GetMessagesLoading extends GetMessagesState {}

class GetMessagesSuccess extends GetMessagesState {
  final List<MessageEntity> messages;
  GetMessagesSuccess({required this.messages});
}

class GetMessagesError extends GetMessagesState {
  final String message;
  GetMessagesError({required this.message});
}
