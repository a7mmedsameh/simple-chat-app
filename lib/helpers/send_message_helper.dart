import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_10/helpers/scroll_down_helper.dart';
import 'package:project_10/constants/constants.dart';

void sendMessage(
  data,
  email,
  TextEditingController controller,
  CollectionReference messages,
) {
  if (data.trim().isEmpty) return;
  messages.add({kMessage: data, kCreatedAt: DateTime.now(), kId: email});
  controller.clear();
  scrollDown();
}
