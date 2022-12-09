import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'avatar.dart';
import '../Models/contact_model.dart';
import '../Screens/display_details_screen.dart';
import '../Utility/convert_helper.dart';

class ContactDetailsItem extends StatefulWidget {
  const ContactDetailsItem({Key? key, required this.contactModel})
      : super(key: key);

  final ContactModel contactModel;

  @override
  State<ContactDetailsItem> createState() => _ContactDetailsItemState();
}

class _ContactDetailsItemState extends State<ContactDetailsItem> {
  String _defultImage =
      "iVBORw0KGgoAAAANSUhEUgAAAFAAAABQCAYAAACOEfKtAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAUrSURBVHgB7ZyLcds4EIb/u7kC1MFtB1YHxlVw6sBIBXEHYgdJKqA7cFKBlArsVCClArmDhBuSY5nZJfEkKYXfzI5tmAQXP94PElhYWFhYWAjkL0zPurGbyqj5Hc3v5xwre2nsubJvzc9n/GGsKruv7LGyU2U/Iu3UxGXxu+hXhalsh3jBhqxsnnU12MoOyC9c1w7Nsy8Wg2mEu3ghCX5VlduwEnW7uGnuXylxcwdj8NqGHjyeU+IC2sj3cOsYWOACaRLEorKgLmLOtjRyifkAN+EM8mEqe3Dw4wNmBFX2hGHhCONBGBbyCTOo0oT+qsP/M5iODYb9I0wEod+5j9A7g7EpMDMRCbp43IlYzA8LvYPjtIya2U89jqwxXwh6xj9hJLTedtL2xAOCLmL23tnissVrIegi3iETBLkNOSGdeFz9t6iHPYfOMzisSPys3Ol5Qwk5xyzi4cTsMDwATj2utD3xJ8VCH6rEsoW7cF3bIp6PStwGCTkgT9dfIly81krEwWnQ0pcEizxV12Xu7GqxvadBnjT+Qsqd2Fy30MXg5/HqCp1dv8bwwqxFHDshzuix4Qays4RwCLoQLm1qodzLvWdMk2KQoS18xHilr3CPQhWxQBxSKdwhEEKGHEG6JkHK3NgqZ5CwZFvI7VMMhHRNAilx/Ys4pMG11S7+uyei/4WwL4hDWmjYo9409+XY3NvlP8TxSQjbaBf3CWiEsM+IQxLwG8KR7o0dm+6FsFvtYk3AteDIixJ5LC8IR7o3hYAvQpziMl2fgF2+Ip7UCc61CLoXwqIFfEY8koA3CEe6N4WfUtPgJWAux/ZCmEF4L2yE8BR+HiE/zxlpyd4gDVLcj/CnRPphVss6Nm5psBs7vmopII/fth5xbJFnPtxCiBRQci4V3PBru2MuIo61JxOlQU4BGas8oxWC/3/eaBOGz79YpGXWAjLaSnCIpVgZ7zJ7AZkHxIv3gDxEaXBAvk6kS4Fw8QrkgSA3Lc5IAuY8cUDw35XL6Y8Rnikulf2jRMCDUeqErZHvlYIj6lUUQt0Z3OLtfPzYGE8nPyP/qw3SFFGcs2sCfhfCcuZ4yxH5qqUPzqtG2lROyuGYOeulcSuEeZV6aSpzwp+DNND3roFSJAbXj4FH4elbkd4LYRtcP3dCWNBaKE+dUldj7t04E0rUQ6UU78q1Q4wSaTL4IMRvEcAKsrMGYWyRTrA+YwEswrBKnIRAdpAHsT4Qhl+DyCUkwQ8pvVEbaQZxpVA7xDimiK69p1HiiG4WDggrhYR5vGzoeuJUqiUHJMBCdswO3NcnXok6x1Psqq0w/IrX0JEPi7A0OiOJ0XdmxCK+SoVA0DOu8LwnSelrMYpT2maQ5hAhPwS/DC+RufS17JQH3Xeuy3Gm0Je14oPpXLeF3sQkh6D3qObsunIshwZ4GPDDIK7TCeK+56Ft25ZzT9kHA70z6RteWWRG2ww69TiWorf1ZeXpI1uOzSnRMW1moTk2FT4+Rh8o94HgN0ieClf/OC2EkSG4izgVsxWvheAm4lTMWrwWwvBqC//fYDwMhrdJZ/HRiXNcjmpwoizyYeC2vzyn7zm8wcJt+YqrTok0pdKgPrHl8ly+5h4JyfH9QEI9cb9zvJ43rHnL8Gvzk/8+4vdTooTXw943eP3uoGtJ2lf2DmGvVEyCxXw+PmZwwVgsn79LAq/SSO+3pbYdrnz/mlCXjNSfAOXOYfSeNUcn4ssabz9Eu2qMOtcdm5/c0XzH6wdoc5/UWlhYWFhYyMNP0c+RF+x3w3EAAAAASUVORK5CYII=";

  @override
  void initState() {
    super.initState();
    // _reloadProfilePic(widget.contactModel.img);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DisplayDetailsScreen(
                    contact: ContactModel(
                      id: widget.contactModel.id,
                      name: widget.contactModel.name,
                      contact: widget.contactModel.contact,
                      img: widget.contactModel.img,
                      email: widget.contactModel.email,
                    ),
                     
                  )),
        )
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
                Avatar(imagePath: widget.contactModel.img ?? _defultImage, imageRadius: 30),
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
                        widget.contactModel.name ?? "",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.contactModel.contact ?? "",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
                SizedBox(
                  width: 50,
                  child: IconButton(
                    onPressed: () async {
                      if(widget.contactModel.contact != null){
                         await FlutterPhoneDirectCaller.callNumber(
                          widget.contactModel.contact.toString()
                          );
                      }
                     
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

  // _reloadProfilePic(file) {
  //   if (file == null) return;
  //   String image = file.toString();
  //   setState(() {
  //     _defultImage = image;
  //   });
  // }
}
