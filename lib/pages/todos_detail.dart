import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class todos_detail extends StatefulWidget {
  String date = "";
  String title = "";
  String subtitle = "";

  todos_detail(this.date, this.title, this.subtitle);

  @override
  _todos_detailState createState() => _todos_detailState();
}

class _todos_detailState extends State<todos_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: Text("Your To-Dos",
            style: GoogleFonts.poppins(color: Colors.black)),
      ),
      body: Column(
        children: [
          Text(widget.title, style: GoogleFonts.poppins()),
          Text(widget.subtitle, style: GoogleFonts.poppins()),
          Text(widget.date, style: GoogleFonts.poppins()),
        ],
      ),
    );
  }
}
