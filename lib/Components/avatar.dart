import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key, required this.imagePath, required this.imageRadius}) : super(key: key);
  
  final String imagePath;
  final double imageRadius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
                    radius: imageRadius,
                    backgroundImage: AssetImage(
                      imagePath,
                    ),
                    backgroundColor: Colors.white,
                  );
  }
}