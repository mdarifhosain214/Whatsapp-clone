import 'package:flutter/material.dart';

class ChatListCard extends StatelessWidget {
  const ChatListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey.shade300,
              radius: 30,
              child: const Icon(
                Icons.groups,
                color: Colors.white,
                size: 30,
              ),
              // child: SvgPicture.asset(
              //   "assets/icons/groups.svg",
              //   height: 35,
              //   width: 35,
              //   // ignore: deprecated_member_use
              //   color: Colors.white,
              // ),
            ),
            title: const Text(
              "Techno Art software",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: const Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  "Hey there",
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
            trailing: const Text("18:09"),
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
