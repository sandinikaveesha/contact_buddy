import 'dart:convert';

import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key, required this.imagePath, required this.imageRadius}) : super(key: key);
  
  final String imagePath;
  final double imageRadius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
                    radius: imageRadius,
                    child: ClipRRect(child: Image.memory(Base64Decoder().convert(imagePath)), borderRadius: BorderRadius.circular(50.0),),
                    backgroundColor: Colors.white,
                  );
  }
}