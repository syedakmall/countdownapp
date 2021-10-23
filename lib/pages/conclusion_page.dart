import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timertask/main.dart';

class conc_page extends StatefulWidget {
  int timetaken = 0;
  IconData icon;

  conc_page(this.timetaken, this.icon);

  @override
  _conc_pageState createState() => _conc_pageState();
}

var _controllertitle = TextEditingController();
var _controllersubtitle = TextEditingController();

class _conc_pageState extends State<conc_page> {
  DateTime now = DateTime.now();
  void openPage(where) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => where));
  }

  String checkIcon(icon) {
    if (icon == Icons.star_border_outlined) {
      return "priority";
    } else if (icon == Icons.task_alt) {
      return "chores";
    } else if (icon == Icons.school_outlined) {
      return "studying";
    } else if (icon == Icons.work_outlined) {
      return "work";
    } else if (icon == Icons.gamepad_outlined) {
      return "gaming";
    } else if (icon == Icons.bed_outlined) {
      return "sleep";
    } else if (icon == CupertinoIcons.question_square) {
      return "others";
    } else {
      return 'else';
    }
  }

  CollectionReference todos = FirebaseFirestore.instance.collection('todos');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title:
            Text("", style: GoogleFonts.poppins(color: Colors.black)),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Center(
            child: Text("Create a to-do list",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 30),
          TextField(
            controller: _controllertitle,
          ),
          SizedBox(height: 30),
          TextField(
            controller: _controllersubtitle,
          ),
          SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                todos.add(
                  {
                    'title': _controllertitle.text,
                    'subtitle': _controllersubtitle.text,
                    'date': "${now.day}/${now.month}/${now.year}",
                    'icon': checkIcon(widget.icon),
                  },
                );
                _controllertitle.clear();
                _controllersubtitle.clear();
                openPage(MyApp());
              },
              child: Text("Done",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold)))
        ],
      ),
    );
  }
}
