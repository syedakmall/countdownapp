import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class history_details extends StatefulWidget {
  String date = "";
  String title = "";
  String subtitle = "";

  history_details(this.date, this.title, this.subtitle);

  @override
  _history_detailsstate createState() => _history_detailsstate();
}

class _history_detailsstate extends State<history_details> {
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
        title: Text("Your History",
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
