
import 'package:flutter/material.dart';
import 'package:project_10/models/messages_model.dart';

class AnotherCustomChatBubble extends StatelessWidget {
 const  AnotherCustomChatBubble({super.key, required this.messages});
final  MessagesModel messages;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          color: Color(0xff006D84),
        ),
        child: Text(messages.message, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
