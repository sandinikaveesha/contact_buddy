import 'package:contact_buddy/Models/contact_model.dart';
import 'package:contact_buddy/Screens/home_screen.dart';
import 'package:contact_buddy/Utility/database_helper.dart';
import 'package:flutter/material.dart';

import '../Components/avatar.dart';
import '../Components/button.dart';
import '../Components/custom_text.dart';

class EditContactScreen extends StatefulWidget {
  const EditContactScreen({Key? key, required this.contact}) : super(key: key);

  final ContactModel contact;

  @override
  State<EditContactScreen> createState() => _EditContactScreenState();
}

class _EditContactScreenState extends State<EditContactScreen> {

  DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  final _ctrlName = TextEditingController();
  final _ctrlContact = TextEditingController();
  final _ctrlEmail = TextEditingController();


  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper.instance;
    _ctrlName.text = widget.contact.name.toString();
    _ctrlContact.text = widget.contact.contact.toString();
    _ctrlEmail.text = widget.contact.email.toString();

  }



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
            Button(buttonText: "Save Changes", action: _update,)
          ],
        ),
      ),
    );
  }

  _update() async{
    if(_ctrlName.text.isEmpty || _ctrlContact.text.isEmpty){
      print('Required Field are missing');
    }

    widget.contact.name = _ctrlName.text;
    widget.contact.contact = _ctrlContact.text;
    widget.contact.email = _ctrlEmail.text;

    await _databaseHelper.updateContact(widget.contact);
    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
  }
}
