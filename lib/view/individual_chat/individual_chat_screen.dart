import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_clone/models/chat_model.dart';

class IndividualChatScrren extends StatefulWidget {
  final ChatModel chatModel;
  const IndividualChatScrren({super.key, required this.chatModel});

  @override
  State<IndividualChatScrren> createState() => _IndividualChatScrrenState();
}

class _IndividualChatScrrenState extends State<IndividualChatScrren> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool _showEmoji = false;
  @override
  void initState() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        _showEmoji = false;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          leadingWidth: 90,
          leading: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                  child: CircleAvatar(
                backgroundColor: Colors.blueGrey.shade300,
                radius: 25,
                child: widget.chatModel.isGroup!
                    ? SvgPicture.asset(
                        widget.chatModel.icon!,
                        height: 35,
                        width: 35,
                        // ignore: deprecated_member_use
                        color: Colors.white,
                      )
                    : SvgPicture.asset(
                        widget.chatModel.icon!,
                        height: 35,
                        width: 35,
                        // ignore: deprecated_member_use
                        color: Colors.white,
                      ),
              )),
            ],
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.chatModel.name!,
                style: const TextStyle(
                    fontSize: 18.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Text(
                "last seen today at 5:52 PM",
                style: TextStyle(fontSize: 11, color: Colors.white),
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.videocam,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.call,
                  color: Colors.white,
                )),
            PopupMenuButton(
                iconColor: Colors.white,
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                      value: "View contact",
                      child: Text("View contact"),
                    ),
                    const PopupMenuItem(
                      value: "View contact",
                      child: Text("View contact"),
                    ),
                    const PopupMenuItem(
                      value: "View contact",
                      child: Text("View contact"),
                    ),
                    const PopupMenuItem(
                      value: "View contact",
                      child: Text("View contact"),
                    ),
                    const PopupMenuItem(
                      value: "View contact",
                      child: Text("View contact"),
                    ),
                  ];
                })
          ],
        ),
        body: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          // ignore: deprecated_member_use
          child: WillPopScope(
              onWillPop: () {
                if (_showEmoji) {
                  _showEmoji = false;
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
              child: Stack(
                children: [
                  ListView(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Card(
                              margin: const EdgeInsets.only(
                                left: 4,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: TextFormField(
                                focusNode: focusNode,
                                textAlignVertical: TextAlignVertical.center,
                                controller: _textEditingController,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: InputDecoration(
                                  hintText: "Type message",
                                  contentPadding: const EdgeInsets.only(
                                      left: 20, right: 10, top: 10, bottom: 10),
                                  border: InputBorder.none,
                                  prefixIcon: IconButton(
                                    onPressed: () {
                                      focusNode.unfocus();
                                      focusNode.canRequestFocus = false;
                                      setState(() {
                                        _showEmoji = !_showEmoji;
                                      });
                                    },
                                    icon: const Icon(Icons.emoji_emotions),
                                  ),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: GestureDetector(
                                            onTap: () {
                                              showModalBottomSheet(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) =>
                                                      bottomSheet());
                                            },
                                            child:
                                                const Icon(Icons.attach_file)),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: Icon(Icons.camera_alt),
                                      ),
                                    ],
                                  ),
                                ),
                                onChanged: (value) {},
                              ),
                            )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.teal,
                                radius: 25,
                                child: _textEditingController.text.isEmpty
                                    ? const Icon(
                                        Icons.mic,
                                        color: Colors.white,
                                      )
                                    : const Icon(
                                        Icons.send,
                                        color: Colors.white,
                                      ),
                              ),
                            )
                          ],
                        ),
                        _showEmoji ? emojiSelect() : const SizedBox()
                      ],
                    ),
                  )
                ],
              )),
        ));
  }

  Widget emojiSelect() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 2.5,
      child: EmojiPicker(
        textEditingController: _textEditingController,
        config: Config(
          columns: 7,
          bgColor: Colors.teal.shade100,
          initCategory: Category.SMILEYS,
          emojiSizeMax: 32 * (Platform.isAndroid ? 1.30 : 1.0),
        ),
      ),
    );
  }

  Widget iconCreation({IconData? icon, Color? color, String? text}) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 30,
          child: Icon(
            icon,
            size: 29,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text!,
          style: const TextStyle(fontSize: 12),
        )
      ],
    );
  }

  Widget bottomSheet() {
    return SizedBox(
      height: 280,
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconCreation(
                    icon: Icons.insert_drive_file,
                    color: Colors.indigo,
                    text: "Documents"),
                const SizedBox(
                  width: 40,
                ),
                iconCreation(
                    icon: Icons.camera_alt, color: Colors.pink, text: "Camera"),
                const SizedBox(
                  width: 40,
                ),
                iconCreation(
                    icon: Icons.insert_photo,
                    color: Colors.purple,
                    text: "Gllery"),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconCreation(
                    icon: Icons.headset, color: Colors.orange, text: "Audio"),
                const SizedBox(
                  width: 40,
                ),
                iconCreation(
                    icon: Icons.location_pin,
                    color: Colors.teal,
                    text: "Location"),
                const SizedBox(
                  width: 40,
                ),
                iconCreation(
                    icon: Icons.person, color: Colors.blue, text: "Contacts"),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
