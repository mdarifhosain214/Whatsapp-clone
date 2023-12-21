import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';

class ContactCard extends StatelessWidget {
  final ChatModel contact;
  const ContactCard({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 53,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade400,
              radius: 25,
              child: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            contact.select
                ? const Positioned(
                    bottom: 4,
                    right: 5,
                    child: CircleAvatar(
                        radius: 11,
                        backgroundColor: Colors.teal,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18,
                        )),
                  )
                : const SizedBox()
          ],
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
    );
  }
}
