import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/view/group/group_card.dart';
import 'package:whatsapp_clone/view/select_contact/contact_card.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel>? contacts = [
    ChatModel(name: "Techno Art", status: "Software company"),
    ChatModel(name: "Towkir", status: "Flutter Developer"),
    ChatModel(name: "Sharif", status: "Developer"),
    ChatModel(name: "Abir", status: "Project Manager"),
  ];
  List<ChatModel> groupList = [];
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
              "New group",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Add perticipants",
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
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: contacts!.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return SizedBox(
                  height: groupList.isNotEmpty ? 90 : 5,
                );
              }
              return InkWell(
                  onTap: () {
                    if (contacts![index - 1].select == false) {
                      setState(() {
                        groupList.add(contacts![index - 1]);
                        contacts![index - 1].select = true;
                      });
                    } else {
                      setState(() {
                        contacts![index - 1].select = false;
                        groupList.remove(contacts![index - 1]);
                      });
                    }
                  },
                  child: ContactCard(contact: contacts![index - 1]));
            },
          ),
          if (groupList.isNotEmpty)
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 75,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: contacts!.length,
                      itemBuilder: (context, index) {
                        if (contacts![index].select == true) {
                          return InkWell(
                            onTap: () {
                              if (contacts![index].select == true) {
                                setState(() {
                                  contacts![index].select = false;
                                  groupList.remove(contacts![index]);
                                });
                              }
                            },
                            child: GroupCard(
                              contacts: contacts![index],
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      }),
                ),
                const Divider(
                  thickness: 1,
                )
              ],
            )
        ],
      ),
    );
  }
}
