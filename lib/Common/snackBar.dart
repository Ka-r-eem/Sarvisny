
import 'package:flutter/material.dart';

class snackBar {

 static void showSnackBar(context , String text , Color color){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
  content: Text(text),
  duration: Duration(seconds: 3),
  backgroundColor:color ));
}
}
