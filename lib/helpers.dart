import 'package:flutter/material.dart';

void showMyDialog(BuildContext context) {
  showDialog(context: context,
      builder: (BuildContext context){
       return AlertDialog(
         title: Text('ERROR'),
         content: Text('กรุณากรอกตัวเลข'),
         actions: <Widget>[
           TextButton(onPressed: (){
             Navigator.of(context).pop();
           }, child: Text('OK'))
         ],
       );
      }
  );
}
