import 'package:flutter/material.dart';
import '.././chat/widgets/chat_list_card.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const ChatListCard();
          }),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        elevation: 0,
        onPressed: () {},
        child: const Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
    );
  }
}
