import 'package:contact_buddy/Screens/create_contact_screen.dart';
import 'package:contact_buddy/Screens/edit_contact_screen.dart';
import 'package:flutter/material.dart';

import 'avatar.dart';

class ContactDetailsItem extends StatelessWidget {
  const ContactDetailsItem(
      {Key? key, required this.name, required this.phoneNo, required this.id})
      : super(key: key);

  final String name;
  final String phoneNo;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditContactScreen(id: id)),
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Avatar(
                    imagePath: "assets/images/profile_image.jpg",
                    imageRadius: 30),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      phoneNo,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
            const Divider(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
