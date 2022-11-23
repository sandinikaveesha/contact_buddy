import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'avatar.dart';
import '../Models/contact_model.dart';
import '../Screens/display_details_screen.dart';
import '../Utility/convert_helper.dart';

class ContactDetailsItem extends StatefulWidget {
  const ContactDetailsItem(
      {Key? key, required this.name, required this.contact, required this.img})
      : super(key: key);

  final String contact;
  final String name;
  final String img;

  @override
  State<ContactDetailsItem> createState() => _ContactDetailsItemState();
}

class _ContactDetailsItemState extends State<ContactDetailsItem> {
   String _profileImg = "";
  @override
  void initState() {
   
    super.initState();
     _reloadProfilePic(widget.img); 
  }


  @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
      onTap: () => {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => DisplayDetailsScreen(contact:widget.contact)),
        // )
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
                 Avatar(
                    imagePath: _profileImg,
                    imageRadius: 30),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.contact,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                  const SizedBox(width: 70,),
                  SizedBox(
                    width: 50,
                    child: IconButton(
                    onPressed: () async{
                      await FlutterPhoneDirectCaller.callNumber(widget.contact.toString());
                    },
                    icon: const Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                ),
                  ),
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

  _reloadProfilePic(file) {
    if(file == null) return;
    String image = file.toString();
    setState(() {
      _profileImg = image;
    });
}
}