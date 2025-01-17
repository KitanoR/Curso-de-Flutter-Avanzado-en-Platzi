import 'package:flutter/material.dart';

class TextInputLocation extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData iconData;

  TextInputLocation({
    Key key,
    @required this.hintText,
    @required this.controller,
    @required this.iconData
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: TextField(
        style: TextStyle(
          fontSize: 15.0,
          fontFamily: "Lato",
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold
        ),
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: Icon(iconData),
          fillColor: Colors.white,
          filled: true,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(9.0)),
          )
        ),
      ),
      decoration: BoxDecoration(
          boxShadow: <BoxShadow> [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15.0,
              offset: Offset(0.0, 7.0)
            )
          ]
        )
    );
  }
}