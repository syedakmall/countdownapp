import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class profile_page extends StatelessWidget {
   profile_page({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(backgroundColor: Colors.yellow, leading : IconButton(icon: Icon(Icons.list_outlined, color : Colors.black),onPressed: () => ZoomDrawer.of(context)!.toggle(),)),

      body : Container(
        child : Center(child: Text("Profile"),)
      )

      
    );
  }
}