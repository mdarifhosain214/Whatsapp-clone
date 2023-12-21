import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';

class GroupCard extends StatelessWidget {
  final ChatModel contacts;
  const GroupCard({
    super.key,
    required this.contacts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade400,
                radius: 25,
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              const Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                    radius: 11,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 13,
                    )),
              )
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            contacts.name!,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
