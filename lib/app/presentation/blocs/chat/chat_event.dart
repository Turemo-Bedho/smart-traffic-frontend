part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}


final class SendQueryEvent extends ChatEvent {
  final String query;
  const SendQueryEvent({required this.query});

  @override
  List<Object> get props => [query];
}