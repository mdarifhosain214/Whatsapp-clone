import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/view/group/create_group.dart';
import 'package:whatsapp_clone/view/select_contact/button_card.dart';
import 'package:whatsapp_clone/view/select_contact/contact_card.dart';

class SelectContacts extends StatefulWidget {
  const SelectContacts({super.key});

  @override
  State<SelectContacts> createState() => _SelectContactsState();
}

class _SelectContactsState extends State<SelectContacts> {
  List<ChatModel>? contacts = [
    ChatModel(name: "Techno Art", status: "Software company"),
    ChatModel(name: "Towkir", status: "Flutter Developer"),
    ChatModel(name: "Sharif", status: "Developer"),
    ChatModel(name: "Abir", status: "Project Manager"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contacts",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "260 Contacts",
              style: TextStyle(fontSize: 13, color: Colors.white),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
          PopupMenuButton(
              iconColor: Colors.white,
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: "Invite a friend",
                    child: Text("Invite a friend"),
                  ),
                  const PopupMenuItem(
                    value: "Contacts",
                    child: Text("Contacts"),
                  ),
                  const PopupMenuItem(
                    value: "Refresh",
                    child: Text("Refresh"),
                  ),
                  const PopupMenuItem(
                    value: "Help",
                    child: Text("Help"),
                  ),
                ];
              })
        ],
      ),
      body: ListView.builder(
        itemCount: contacts!.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const CreateGroup())),
                child: const ButtonCard(name: "New group", icon: Icons.group));
          } else if (index == 1) {
            return const ButtonCard(
              name: "New contacts",
              icon: Icons.person,
            );
          }
          return ContactCard(contact: contacts![index - 2]);
        },
      ),
    );
  }
}
