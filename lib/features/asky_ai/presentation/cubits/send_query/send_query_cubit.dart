import 'package:bloc/bloc.dart';
import 'package:zyntra/features/asky_ai/domain/entities/message_entity.dart';
import 'package:zyntra/features/asky_ai/domain/entities/query_entity.dart';
import 'package:zyntra/features/asky_ai/domain/use_cases/send_query_use_case.dart';

part 'send_query_state.dart';

class SendQueryCubit extends Cubit<SendQueryState> {
  final SendQueryUseCase useCase;
  SendQueryCubit({required this.useCase}) : super(SendQueryInitial());

  Future<void> sendQuery({required QueryEntity query}) async {
    emit(SendQueryLoading());

    final result = await useCase.call(query);

    result.fold(
      (failure) => emit(SendQueryFailure(message: failure.message)),
      (message) => emit(SendQuerySuccess(message: message)),
    );
  }
}
