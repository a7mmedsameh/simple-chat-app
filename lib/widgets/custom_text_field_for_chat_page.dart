
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_10/helpers/send_message_helper.dart';
import 'package:project_10/constants/constants.dart';

class CustomTextFieldForChatPage extends StatelessWidget {
  const CustomTextFieldForChatPage({
    super.key,
    required this.controller,
    required this.email,
    required this.messages,
  });

  final TextEditingController controller;
  final Object? email;
  final CollectionReference<Object?> messages;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (data) {
        sendMessage(data, email, controller, messages);
      },
      decoration: InputDecoration(
        hintText: 'Send Message',
        suffixIcon: IconButton(
          onPressed: () {
            sendMessage(
              controller.text,
              email,
              controller,
              messages,
            );
          },
          icon: const Icon(Icons.send, color: kPrimaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: kPrimaryColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}