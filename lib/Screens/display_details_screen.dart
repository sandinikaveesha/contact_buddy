import 'package:contact_buddy/Components/avatar.dart';
import 'package:contact_buddy/Models/contact_model.dart';
import 'package:contact_buddy/Screens/edit_contact_screen.dart';
import 'package:contact_buddy/Screens/home_screen.dart';
import 'package:contact_buddy/Utility/database_helper.dart';
import 'package:flutter/material.dart';

class DisplayDetailsScreen extends StatefulWidget {
  DisplayDetailsScreen({Key? key, required this.contact}) : super(key: key);

  final ContactModel contact;

  @override
  State<DisplayDetailsScreen> createState() => _DisplayDetailsScreenState();
}

class _DisplayDetailsScreenState extends State<DisplayDetailsScreen> {

  DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                PopupMenuButton<PopupMenuItem>(
                  color: const Color.fromARGB(255, 53, 53, 53),
                  elevation: 24,
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => EditContactScreen(contact:  widget.contact,)),
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.edit, color: Colors.white, size: 20),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Edit Contact',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )),
                    PopupMenuItem(
                      child: GestureDetector(
                        onTap: () => showAlertDialog(),
                        child: Row(
                          children: const [
                            Icon(Icons.delete, color: Colors.white, size: 20),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Delete Contact',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Avatar(
                imagePath: "assets/images/profile_image.jpg", imageRadius: 40),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                widget.contact.name.toString(),
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              tileColor: Colors.transparent,
              leading: const Icon(
                Icons.phone,
                color: Colors.white,
              ),
              title: Text(widget.contact.contact.toString(),
                  style: const TextStyle(color: Colors.white)),
            ),
            const SizedBox(
              height: 5,
            ),
            ListTile(
              tileColor: Colors.transparent,
              leading: const Icon(
                Icons.email,
                color: Colors.white,
              ),
              title: Text(widget.contact.email.toString(),
                  style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog() => showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: const Text(
              "Delete Contact",
              style: TextStyle(color: Colors.white),
            ),
            content: const Text("Are you sure want to delete this contact?",
                style: TextStyle(color: Colors.white)),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:
                      const Text("No", style: TextStyle(color: Colors.white))),
              TextButton(
                onPressed: () async{
                    await _databaseHelper.deleteContact(widget.contact.id!);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                },
                child: const Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
            elevation: 24,
            backgroundColor: const Color.fromARGB(255, 53, 53, 53),
          ));

    
}
