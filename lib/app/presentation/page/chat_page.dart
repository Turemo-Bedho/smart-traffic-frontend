import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_application/app/presentation/blocs/chat/chat_bloc.dart';
import 'package:my_flutter_application/app/presentation/widget/chat_list_view.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  final TextEditingController chatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatLoaded>(
      builder: (context, state) {
        return Column(
          children: [
            AppBar(
              backgroundColor: Color(0xFF1F222A),
              toolbarHeight: 55.h,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      backgroundImage: Image.asset(
                        'assets/images/officer_profile.jpeg',
                        width: 24.w,
                        height: 24.h,
                        fit: BoxFit.cover,
                      ).image,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Ask your questions",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
            ),
            Expanded(
              child: ChatList(
                chats: state.chats,
              ),
            ),
            TextField(
              onSubmitted: (value) {
                context.read<ChatBloc>().add(
                      SendQueryEvent(query: chatController.text),
                    );
                chatController.clear();
                },
              controller: chatController,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.w),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.send_rounded,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    context
                        .read<ChatBloc>()
                        .add(SendQueryEvent(query: chatController.text));
                    chatController.clear();
                  },
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60.r),
                  borderSide: BorderSide(
                    color: Color(0xFF1F222A),
                    width: 2.w,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60.r),
                  borderSide: BorderSide(
                    color: Color(0xFF1F222A),
                    width: 2.w,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60.r),
                  borderSide: BorderSide(
                    color: Color(0xFF1F222A),
                    width: 2.w,
                  ),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        );
      },
    );
  }
}
