import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';

class ContactCard extends StatelessWidget {
  final ChatModel contact;
  const ContactCard({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade400,
          radius: 25,
          child: const Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
        title: Text(
          contact.name!,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          contact.status!,
          style: const TextStyle(fontSize: 13),
        ),
      ),
    );
  }
}
