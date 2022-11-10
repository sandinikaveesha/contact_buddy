import 'package:contact_buddy/Components/avatar.dart';
import 'package:contact_buddy/Components/custom_text.dart';
import 'package:flutter/material.dart';

class EditContactScreen extends StatelessWidget {
  const EditContactScreen({Key? key, required this.id}) : super(key: key);

  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(60, 60, 68, 100),
        title: const Text(
          "Edit Contact",
          style: TextStyle(fontSize: 20, letterSpacing: 0.3),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            /// id eken data filter karana vidiya
            //Text(id.toString(), style: TextStyle(color: Colors.white),),
            const Center(
                child: Avatar(
                    imagePath: "assets/images/profile_image.jpg",
                    imageRadius: 40)),
            const SizedBox(
              height: 40,
            ),
            CustomText(
              icon: Icons.person_add_alt_outlined,
              hintText: "Name",
            ),
            const SizedBox(
              height: 15,
            ),
            CustomText(
              icon: Icons.phone_outlined,
              hintText: "Phone",
            ),
            const SizedBox(
              height: 15,
            ),
            CustomText(
              icon: Icons.email_outlined,
              hintText: "Email",
            ),
          ],
        ),
      ),
    );
  }
}
