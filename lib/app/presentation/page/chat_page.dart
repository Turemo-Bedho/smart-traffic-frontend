import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: Color.fromRGBO(0, 0, 0, 0.2),
          toolbarHeight: 55.h,
          title: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 12.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20.r,
            
                  backgroundImage:
                      Image.asset(
                        'assets/images/officer_profile.jpeg',
                        width: 24.w,
                        height: 24.h,
                        fit: BoxFit.cover,
                      ).image,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Chat Officer"), // centered
                  ),
                ),
              ],
            ),
          ),
          centerTitle: true,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(title: Text('Chat message $index'));
            },
          ),
        ),
      ],
    );
  }
}
