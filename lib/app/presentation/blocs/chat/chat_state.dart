part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  const ChatState();
  
  @override
  List<Object> get props => [];
}


final class ChatLoaded extends ChatState {
  final List<Either<ReportEntity, String>> chats;
  const ChatLoaded({required this.chats});
  
  @override
  List<Object> get props => [chats];
}
