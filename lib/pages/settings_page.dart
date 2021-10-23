import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class settings_page extends StatelessWidget {
   settings_page({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(backgroundColor: Colors.yellow, leading : IconButton(icon: Icon(Icons.list_outlined, color : Colors.black),onPressed: () => ZoomDrawer.of(context)!.toggle(),)),

      body : Container(
        child : Center(child: Text("Settings"),)
      )

      
    );
  }
}