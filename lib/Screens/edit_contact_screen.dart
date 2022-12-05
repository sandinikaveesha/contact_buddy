import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Components/avatar.dart';
import '../Components/button.dart';
import '../Components/custom_text.dart';
import '../Models/contact_model.dart';
import '../Screens/home_screen.dart';
import '../Utility/convert_helper.dart';
import '../Utility/database_helper.dart';

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
String _defultImage = "iVBORw0KGgoAAAANSUhEUgAAAFAAAABQCAYAAACOEfKtAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAUrSURBVHgB7ZyLcds4EIb/u7kC1MFtB1YHxlVw6sBIBXEHYgdJKqA7cFKBlArsVCClArmDhBuSY5nZJfEkKYXfzI5tmAQXP94PElhYWFhYWAjkL0zPurGbyqj5Hc3v5xwre2nsubJvzc9n/GGsKruv7LGyU2U/Iu3UxGXxu+hXhalsh3jBhqxsnnU12MoOyC9c1w7Nsy8Wg2mEu3ghCX5VlduwEnW7uGnuXylxcwdj8NqGHjyeU+IC2sj3cOsYWOACaRLEorKgLmLOtjRyifkAN+EM8mEqe3Dw4wNmBFX2hGHhCONBGBbyCTOo0oT+qsP/M5iODYb9I0wEod+5j9A7g7EpMDMRCbp43IlYzA8LvYPjtIya2U89jqwxXwh6xj9hJLTedtL2xAOCLmL23tnissVrIegi3iETBLkNOSGdeFz9t6iHPYfOMzisSPys3Ol5Qwk5xyzi4cTsMDwATj2utD3xJ8VCH6rEsoW7cF3bIp6PStwGCTkgT9dfIly81krEwWnQ0pcEizxV12Xu7GqxvadBnjT+Qsqd2Fy30MXg5/HqCp1dv8bwwqxFHDshzuix4Qays4RwCLoQLm1qodzLvWdMk2KQoS18xHilr3CPQhWxQBxSKdwhEEKGHEG6JkHK3NgqZ5CwZFvI7VMMhHRNAilx/Ys4pMG11S7+uyei/4WwL4hDWmjYo9409+XY3NvlP8TxSQjbaBf3CWiEsM+IQxLwG8KR7o0dm+6FsFvtYk3AteDIixJ5LC8IR7o3hYAvQpziMl2fgF2+Ip7UCc61CLoXwqIFfEY8koA3CEe6N4WfUtPgJWAux/ZCmEF4L2yE8BR+HiE/zxlpyd4gDVLcj/CnRPphVss6Nm5psBs7vmopII/fth5xbJFnPtxCiBRQci4V3PBru2MuIo61JxOlQU4BGas8oxWC/3/eaBOGz79YpGXWAjLaSnCIpVgZ7zJ7AZkHxIv3gDxEaXBAvk6kS4Fw8QrkgSA3Lc5IAuY8cUDw35XL6Y8Rnikulf2jRMCDUeqErZHvlYIj6lUUQt0Z3OLtfPzYGE8nPyP/qw3SFFGcs2sCfhfCcuZ4yxH5qqUPzqtG2lROyuGYOeulcSuEeZV6aSpzwp+DNND3roFSJAbXj4FH4elbkd4LYRtcP3dCWNBaKE+dUldj7t04E0rUQ6UU78q1Q4wSaTL4IMRvEcAKsrMGYWyRTrA+YwEswrBKnIRAdpAHsT4Qhl+DyCUkwQ8pvVEbaQZxpVA7xDimiK69p1HiiG4WDggrhYR5vGzoeuJUqiUHJMBCdswO3NcnXok6x1Psqq0w/IrX0JEPi7A0OiOJ0XdmxCK+SoVA0DOu8LwnSelrMYpT2maQ5hAhPwS/DC+RufS17JQH3Xeuy3Gm0Je14oPpXLeF3sQkh6D3qObsunIshwZ4GPDDIK7TCeK+56Ft25ZzT9kHA70z6RteWWRG2ww69TiWorf1ZeXpI1uOzSnRMW1moTk2FT4+Rh8o94HgN0ieClf/OC2EkSG4izgVsxWvheAm4lTMWrwWwvBqC//fYDwMhrdJZ/HRiXNcjmpwoizyYeC2vzyn7zm8wcJt+YqrTok0pdKgPrHl8ly+5h4JyfH9QEI9cb9zvJ43rHnL8Gvzk/8+4vdTooTXw943eP3uoGtJ2lf2DmGvVEyCxXw+PmZwwVgsn79LAq/SSO+3pbYdrnz/mlCXjNSfAOXOYfSeNUcn4ssabz9Eu2qMOtcdm5/c0XzH6wdoc5/UWlhYWFhYyMNP0c+RF+x3w3EAAAAASUVORK5CYII=";

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper.instance;
    _ctrlName.text = widget.contact.name.toString();
    _ctrlContact.text = widget.contact.contact.toString();
    _ctrlEmail.text = widget.contact.email.toString();
    _reloadProfilePic(widget.contact.img);

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
            Center(
              child: Stack(children: [
                Avatar(
                  imagePath: _defultImage, imageRadius: 40),
                  Positioned(bottom: 0, right: 0,child: GestureDetector( onTap: _uploadImg,  child: const Icon(Icons.add_a_photo_rounded, color: Colors.greenAccent,),))
              ],),
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
   _uploadImg() async {
    late String stringImg;

    ImagePicker().pickImage(source: ImageSource.gallery).then((imgFile) async {
     stringImg = Convertor.imageToString(await imgFile!.readAsBytes());
     widget.contact.img = stringImg;
     _reloadProfilePic(stringImg);
    });
    
    //print(stringImg);
  }

  _reloadProfilePic(file) {
    if(file == null) return;
    String image = file.toString();
    setState(() {
     _defultImage = image;
    });
    
  }

}
