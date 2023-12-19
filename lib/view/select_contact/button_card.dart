import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  final String name;
  final IconData icon;
  const ButtonCard({super.key, required this.name, required this.icon});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xff250d366),
          radius: 25,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
