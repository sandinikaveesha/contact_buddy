import 'package:contact_buddy/Components/custom_bottom_navigation_bar.dart';
import 'package:contact_buddy/Models/contact_model.dart';
import 'package:contact_buddy/Screens/home_screen.dart';
import 'package:contact_buddy/Utility/database_helper.dart';
import 'package:flutter/material.dart';

import '../Components/avatar.dart';
import '../Components/button.dart';
import '../Components/custom_text.dart';

class CreateContactScreen extends StatefulWidget {
  CreateContactScreen({Key? key}) : super(key: key);

  @override
  State<CreateContactScreen> createState() => _CreateContactScreenState();
}

class _CreateContactScreenState extends State<CreateContactScreen> {

  ContactModel _contact = ContactModel();
  DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  final _ctrlName = TextEditingController();
  final _ctrlContact = TextEditingController();
  final _ctrlEmail = TextEditingController();

  @override
  void initState(){
    super.initState();
    setState(() {
      _databaseHelper = DatabaseHelper.instance;
    });
  }

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
              controller: _ctrlName,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomText(
              icon: Icons.phone_rounded,
              hintText: "Phone",
              controller: _ctrlContact,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomText(
              icon: Icons.email_rounded,
              hintText: "Email",
              controller: _ctrlEmail,
            ),
            const SizedBox(
              height: 30,
            ),
            Button(
              buttonText: "Create Contact",
              action: _create,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 1,),
    );
  }

  _create() async{
    if(_ctrlName.text.isEmpty || _ctrlContact.text.isEmpty){
      print('Required Field are missing');
    }

    _contact.name = _ctrlName.text;
    _contact.contact = _ctrlContact.text;
    _contact.email = _ctrlEmail.text;

    await _databaseHelper.createContact(_contact);
    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
  }
}
