import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:my_flutter_application/app/domain/entities/chat.dart';

class ChatList extends StatelessWidget {
  final List<Either<ReportEntity, String>> chats;

  const ChatList({Key? key, required this.chats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];

        return chat.fold(
          // Left: chatbot answer (ReportEntity)
          (report) => Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Confidence: ${report.confidence}", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: () {
                      // open PDF or handle action
                    },
                    child: Text(
                      "📄 View Report",
                      style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Right: user question (String)
          (question) => Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(question),
            ),
          ),
        );
      },
    );
  }
}
