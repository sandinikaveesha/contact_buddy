import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({
    Key? key,
    required this.icon,
    required this.hintText,
    this.controller
  }) : super(key: key);

  final IconData icon;
  final String hintText;
  final TextEditingController? controller;
  

  @override
  Widget build(BuildContext context) {
    return Container(
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
          SizedBox(
            width: 30,
            height: 30,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: TextField(
              
              controller: controller,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  contentPadding: const EdgeInsets.only(left: 15, right: 15),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
