import 'package:flutter/material.dart';
import 'package:project_10/helpers/scroll_down_helper.dart';
import 'package:project_10/models/messages_model.dart';
import 'package:project_10/widgets/another_chat_bubble.dart';
import 'package:project_10/widgets/custom_chat_bubble.dart';

class CustomListViewBuilder extends StatelessWidget {
  const CustomListViewBuilder({
    super.key,
    required this.messagesList,
    required this.email,
  });

  final List<MessagesModel> messagesList;
  final Object? email;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      controller: controllerDown,
      itemCount: messagesList.length,
      itemBuilder: (context, i) {
        return messagesList[i].id == email
            ? CustomChatBubble(messages: messagesList[i])
            : AnotherCustomChatBubble(messages: messagesList[i]);
      },
    );
  }
}
