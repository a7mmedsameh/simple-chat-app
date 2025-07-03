import 'package:flutter/material.dart';
import 'package:project_10/models/messages_model.dart';
import 'package:project_10/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_10/widgets/custom_icon_button_for_sign_out.dart';
import 'package:project_10/widgets/custom_list_veiw_builder.dart';
import 'package:project_10/widgets/custom_text_field_for_chat_page.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static String id = 'ChatPage';
  final CollectionReference messages = FirebaseFirestore.instance.collection(
    kMessagesCollections,
  );
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessagesModel> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(MessagesModel.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 6,
              shadowColor: Colors.black,
              backgroundColor: kPrimaryColor,
              title: Row(
                children: [
                  Image.asset(kLogo, height: 50),
                  const SizedBox(width: 5),
                  const Text(
                    'Chat',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Pacifico-Regular',
                    ),
                  ),
                ],
              ),
              actions: const [CustomIconButtonForSignOut()],
            ),
            body: Column(
              children: [
                Expanded(
                  child: CustomListViewBuilder(
                    messagesList: messagesList,
                    email: email,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: CustomTextFieldForChatPage(
                    controller: controller,
                    email: email,
                    messages: messages,
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
