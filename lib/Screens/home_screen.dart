import 'package:flutter/material.dart';

import '../Components/contact_details_item.dart';
import '../Components/search_bar.dart';

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
              const SearchBar(),
              const SizedBox(height: 30),
              Expanded(
                  child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const ContactDetailsItem();
                },
              ))
            ],
          ),
        ));
  }
}
