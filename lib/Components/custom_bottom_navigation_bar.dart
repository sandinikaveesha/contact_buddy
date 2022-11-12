import 'package:contact_buddy/Screens/create_contact_screen.dart';
import 'package:contact_buddy/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;


  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GNav(
          selectedIndex: _selectedIndex,
          tabMargin: const EdgeInsets.symmetric(vertical: 5),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          backgroundColor: const Color.fromRGBO(60, 60, 68, 100),
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey.shade700,
          gap: 10,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          
          tabs: [
            GButton(
              icon: Icons.home,
              iconColor: Colors.white,
              text: 'Home',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            GButton(
              icon: Icons.contact_page,
              iconColor: Colors.white,
              text: 'Create',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateContactScreen(),
                  ),
                );
              },
            ),
          ]),
    );
  }
}
