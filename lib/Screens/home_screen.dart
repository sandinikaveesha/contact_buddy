import 'package:contact_buddy/Models/contact_model.dart';
import 'package:flutter/material.dart';

import '../Components/contact_details_item.dart';
import '../Components/custom_bottom_navigation_bar.dart';
import '../Utility/database_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> _contacts = [];
  List<Map<String, dynamic>> _searchContacts = [];

  DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper.instance;
    _showContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(60, 60, 68, 100),
        title: const Text(
          "My Contacts",
          style: TextStyle(fontSize: 20, letterSpacing: 0.3),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(99, 133, 132, 132),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const SizedBox(
                    width: 30,
                    height: 30,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: (value) => _search(value),
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                          contentPadding: EdgeInsets.only(left: 15, right: 15),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: _searchContacts.length,
                itemBuilder: (context, index) {
                  final contact = _searchContacts[index];
                  return ContactDetailsItem(
                    contactModel: ContactModel.fromMap(contact),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        index: 0,
      ),
    );
  }

  _showContacts() async {
    List<Map<String, dynamic>> contacts = await _databaseHelper.getContacts();
    setState(() {
      _contacts = contacts;
      _searchContacts = contacts;
    });
  }

  void _search(String value) {
    setState(() {
      _searchContacts = _contacts
          .where((element) =>
              element['name']!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }
}
