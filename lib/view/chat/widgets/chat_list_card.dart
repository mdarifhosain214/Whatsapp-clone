import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/view/individual_chat/individual_chat_screen.dart';

class ChatListCard extends StatelessWidget {
  final ChatModel chatModel;
  const ChatListCard({super.key, required this.chatModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IndividualChatScrren(
                      chatModel: chatModel,
                    )));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey.shade300,
              radius: 30,

              // ? const Icon(
              //     Icons.groups,
              //     color: Colors.white,
              //     size: 30,
              //   )
              // : const Icon(
              //     Icons.person,
              //     color: Colors.white,
              //     size: 30,
              //   ),
              child: chatModel.isGroup!
                  ? SvgPicture.asset(
                      chatModel.icon!,
                      height: 35,
                      width: 35,
                      // ignore: deprecated_member_use
                      color: Colors.white,
                    )
                  : SvgPicture.asset(
                      chatModel.icon!,
                      height: 35,
                      width: 35,
                      // ignore: deprecated_member_use
                      color: Colors.white,
                    ),
            ),
            title: Text(
              chatModel.name!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all),
                const SizedBox(
                  width: 4.0,
                ),
                Text(
                  chatModel.currentMessage!,
                  style: const TextStyle(fontSize: 13),
                )
              ],
            ),
            trailing: Text(chatModel.time!),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 90, right: 20),
            child: Divider(
              thickness: .2,
            ),
          )
        ],
      ),
    );
  }
}
