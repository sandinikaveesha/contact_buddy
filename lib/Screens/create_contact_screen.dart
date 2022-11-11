import 'package:flutter/material.dart';

import '../Components/avatar.dart';
import '../Components/button.dart';
import '../Components/custom_text.dart';

class CreateContactScreen extends StatelessWidget {
  const CreateContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(60, 60, 68, 100),
        title: const Text(
          "Create New Contact",
          style: TextStyle(fontSize: 20, letterSpacing: 0.3),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            const Center(
              child: Avatar(
                  imagePath: "assets/images/avatar.png", imageRadius: 40),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomText(
              icon: Icons.person_add_alt_rounded,
              hintText: "Name",
            ),
            const SizedBox(
              height: 15,
            ),
            CustomText(
              icon: Icons.phone_rounded,
              hintText: "Phone",
            ),
            const SizedBox(
              height: 15,
            ),
            CustomText(
              icon: Icons.email_rounded,
              hintText: "Email",
            ),
            const SizedBox(
              height: 30,
            ),
            const Button(buttonText: "Create Contact",),

          ],
        ),
      ),
    );
  }
}
