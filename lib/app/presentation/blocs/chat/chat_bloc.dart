import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_flutter_application/app/domain/entities/chat.dart';
import 'package:my_flutter_application/app/domain/usecase/send_query.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatLoaded> {
  final SendQueryUsecase sendQueryUsecase;
  ChatBloc({required this.sendQueryUsecase}) : super(ChatLoaded(chats: [])) {
    on<SendQueryEvent>(_sendQueryHandler);
  }

  _sendQueryHandler(
    SendQueryEvent event,
    Emitter<ChatLoaded> emit,
  ) async {
     final newMessages = List<Either<ReportEntity, String>>.from(state.chats)
    ..add(Right(event.query));

  // Emit new state with the user's message immediately
  emit(ChatLoaded(chats: newMessages));

  final result = await sendQueryUsecase(SendQueryParams(query: event.query));

  result.fold(
    (failure) {
      final updatedMessages = List<Either<ReportEntity, String>>.from(newMessages)
        ..add(Right(failure.message));
      emit(ChatLoaded(chats: updatedMessages));
    },
    (report) {
      final updatedMessages = List<Either<ReportEntity, String>>.from(newMessages)
        ..add(Left(report));
      emit(ChatLoaded(chats: updatedMessages));
    },
  );
  }
}
