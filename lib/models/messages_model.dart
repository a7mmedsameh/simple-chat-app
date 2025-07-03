import 'package:project_10/constants/constants.dart';

class MessagesModel {
  final String message;
  final String id;
  MessagesModel(this.message, this.id);

  factory MessagesModel.fromJson(jsonData) {
    return MessagesModel(jsonData[kMessage], jsonData[kId]);
  }
}
