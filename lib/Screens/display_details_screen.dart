import 'package:flutter/material.dart';

import '../Components/avatar.dart';
import '../Models/contact_model.dart';
import '../Screens/edit_contact_screen.dart';
import '../Screens/home_screen.dart';
import '../Utility/convert_helper.dart';
import '../Utility/database_helper.dart';

class DisplayDetailsScreen extends StatefulWidget {
  const DisplayDetailsScreen({Key? key, required this.contact}) : super(key: key);

  final ContactModel contact;

  @override
  State<DisplayDetailsScreen> createState() => _DisplayDetailsScreenState();
}

class _DisplayDetailsScreenState extends State<DisplayDetailsScreen> {
  DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  String _defultImage =
      "iVBORw0KGgoAAAANSUhEUgAAAFAAAABQCAYAAACOEfKtAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAUrSURBVHgB7ZyLcds4EIb/u7kC1MFtB1YHxlVw6sBIBXEHYgdJKqA7cFKBlArsVCClArmDhBuSY5nZJfEkKYXfzI5tmAQXP94PElhYWFhYWAjkL0zPurGbyqj5Hc3v5xwre2nsubJvzc9n/GGsKruv7LGyU2U/Iu3UxGXxu+hXhalsh3jBhqxsnnU12MoOyC9c1w7Nsy8Wg2mEu3ghCX5VlduwEnW7uGnuXylxcwdj8NqGHjyeU+IC2sj3cOsYWOACaRLEorKgLmLOtjRyifkAN+EM8mEqe3Dw4wNmBFX2hGHhCONBGBbyCTOo0oT+qsP/M5iODYb9I0wEod+5j9A7g7EpMDMRCbp43IlYzA8LvYPjtIya2U89jqwxXwh6xj9hJLTedtL2xAOCLmL23tnissVrIegi3iETBLkNOSGdeFz9t6iHPYfOMzisSPys3Ol5Qwk5xyzi4cTsMDwATj2utD3xJ8VCH6rEsoW7cF3bIp6PStwGCTkgT9dfIly81krEwWnQ0pcEizxV12Xu7GqxvadBnjT+Qsqd2Fy30MXg5/HqCp1dv8bwwqxFHDshzuix4Qays4RwCLoQLm1qodzLvWdMk2KQoS18xHilr3CPQhWxQBxSKdwhEEKGHEG6JkHK3NgqZ5CwZFvI7VMMhHRNAilx/Ys4pMG11S7+uyei/4WwL4hDWmjYo9409+XY3NvlP8TxSQjbaBf3CWiEsM+IQxLwG8KR7o0dm+6FsFvtYk3AteDIixJ5LC8IR7o3hYAvQpziMl2fgF2+Ip7UCc61CLoXwqIFfEY8koA3CEe6N4WfUtPgJWAux/ZCmEF4L2yE8BR+HiE/zxlpyd4gDVLcj/CnRPphVss6Nm5psBs7vmopII/fth5xbJFnPtxCiBRQci4V3PBru2MuIo61JxOlQU4BGas8oxWC/3/eaBOGz79YpGXWAjLaSnCIpVgZ7zJ7AZkHxIv3gDxEaXBAvk6kS4Fw8QrkgSA3Lc5IAuY8cUDw35XL6Y8Rnikulf2jRMCDUeqErZHvlYIj6lUUQt0Z3OLtfPzYGE8nPyP/qw3SFFGcs2sCfhfCcuZ4yxH5qqUPzqtG2lROyuGYOeulcSuEeZV6aSpzwp+DNND3roFSJAbXj4FH4elbkd4LYRtcP3dCWNBaKE+dUldj7t04E0rUQ6UU78q1Q4wSaTL4IMRvEcAKsrMGYWyRTrA+YwEswrBKnIRAdpAHsT4Qhl+DyCUkwQ8pvVEbaQZxpVA7xDimiK69p1HiiG4WDggrhYR5vGzoeuJUqiUHJMBCdswO3NcnXok6x1Psqq0w/IrX0JEPi7A0OiOJ0XdmxCK+SoVA0DOu8LwnSelrMYpT2maQ5hAhPwS/DC+RufS17JQH3Xeuy3Gm0Je14oPpXLeF3sQkh6D3qObsunIshwZ4GPDDIK7TCeK+56Ft25ZzT9kHA70z6RteWWRG2ww69TiWorf1ZeXpI1uOzSnRMW1moTk2FT4+Rh8o94HgN0ieClf/OC2EkSG4izgVsxWvheAm4lTMWrwWwvBqC//fYDwMhrdJZ/HRiXNcjmpwoizyYeC2vzyn7zm8wcJt+YqrTok0pdKgPrHl8ly+5h4JyfH9QEI9cb9zvJ43rHnL8Gvzk/8+4vdTooTXw943eP3uoGtJ2lf2DmGvVEyCxXw+PmZwwVgsn79LAq/SSO+3pbYdrnz/mlCXjNSfAOXOYfSeNUcn4ssabz9Eu2qMOtcdm5/c0XzH6wdoc5/UWlhYWFhYyMNP0c+RF+x3w3EAAAAASUVORK5CYII=";

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper.instance;
    // _reloadProfilePic(widget.contact.img);
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
                              builder: ((context) => EditContactScreen(
                                    contact: widget.contact,
                                  )),
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
                      ),
                    ),
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
            Avatar(
                imagePath: widget.contact.img ?? _defultImage, imageRadius: 40),
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
                onPressed: () async {
                  await _databaseHelper.deleteContact(widget.contact.id!);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
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

  // _reloadProfilePic(file) {
  //   if (file == null) return;
  //   String image = file.toString();
  //   setState(() {
  //    _defultImage = image;
  //   });
  // }
}
