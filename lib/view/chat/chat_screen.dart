import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/view/select_contact/select_contacts.dart';
import '.././chat/widgets/chat_list_card.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatModel> chatList = [
    ChatModel(
        name: "Techno Art",
        isGroup: true,
        icon: "assets/icons/groups.svg",
        time: "4:49 PM",
        currentMessage: "Hey there."),
    ChatModel(
        name: "Tonmy",
        isGroup: false,
        icon: "assets/icons/person.svg",
        time: "5:49 PM",
        currentMessage: "Hi there."),
    ChatModel(
        name: "Tanvir",
        isGroup: false,
        icon: "assets/icons/person.svg",
        time: "5:49 PM",
        currentMessage: "Hi there."),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chatList.length,
          itemBuilder: (context, index) {
            return ChatListCard(chatModel: chatList[index]);
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        shape: const CircleBorder(),
        elevation: 0,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SelectContacts()));
        },
        child: const Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
    );
  }
}
