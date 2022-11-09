import 'package:contact_buddy/Components/contact_details_item.dart';
import 'package:contact_buddy/Components/search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromRGBO(60, 60, 68, 100),
          title: const Text(
            "My Contacts",
            style: TextStyle(fontSize: 20, letterSpacing: 0.3),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SearchBar(),
              SizedBox(height: 30 ,),
              ContactDetailsItem(),
            ],
          ),
        ));
  }
}
