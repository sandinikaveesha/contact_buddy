import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          color: const Color.fromARGB(99, 133, 132, 132),
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 30,
            height: 30,
            child: Icon(
              Icons.search_outlined,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: TextField(
              onTap: null,
              decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  contentPadding: EdgeInsets.only(left: 15, right: 15),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
