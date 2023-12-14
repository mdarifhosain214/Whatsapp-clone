import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/view/chat/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "WhatsApp Clone",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
          PopupMenuButton<String>(
              iconColor: Colors.white,
              color: Colors.white,
              onSelected: (value) {
                log(' $value');
              },
              itemBuilder: (context) {
                return const [
                  PopupMenuItem(
                    value: "New group",
                    child: Text("New group"),
                  ),
                  PopupMenuItem(
                    value: "New broadcast",
                    child: Text("New broadcast"),
                  ),
                  PopupMenuItem(
                    value: "Whatsappweb ",
                    child: Text("Whatsappweb"),
                  ),
                  PopupMenuItem(
                    value: "Start message",
                    child: Text("Start message"),
                  ),
                  PopupMenuItem(
                    value: "Setting",
                    child: Text(
                      "Setting",
                    ),
                  ),
                ];
              })
        ],
        bottom: TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.grey.shade400,
            //indicatorWeight: 1,
            controller: _tabController,
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.camera_alt,
                ),
              ),
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: 'STATUS',
              ),
              Tab(text: 'CALLS')
            ]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text(' This Camera section is Under Construction')),
          ChatScreen(),
          Center(child: Text(' This Status section is Under Construction')),
          Center(child: Text(' This Calls section is Under Construction')),
        ],
      ),
    );
  }
}
