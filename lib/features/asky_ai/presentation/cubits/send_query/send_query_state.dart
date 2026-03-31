part of 'send_query_cubit.dart';

sealed class SendQueryState {}

class SendQueryInitial extends SendQueryState {}

class SendQueryLoading extends SendQueryState {}

class SendQuerySuccess extends SendQueryState {
  final MessageEntity message;
  SendQuerySuccess({required this.message});
}

class SendQueryFailure extends SendQueryState {
  final String message;
  SendQueryFailure({required this.message});
}
