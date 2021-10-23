import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:timertask/pages/history_details.dart';

class history_page extends StatefulWidget {
  int durationtimer = 0;
  String title = "";
  String desc = "";
  history_page({Key? key}) : super(key: key);

  @override
  State<history_page> createState() => _history_pageState();
}

class _history_pageState extends State<history_page> {
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

  IconData iconLeading(icon) {
    if (icon == 'priority') {
      return Icons.star_border_outlined;
    } else if (icon == 'chores') {
      return Icons.task_alt;
    }
    if (icon == 'studying') {
      return Icons.school_outlined;
    }
    if (icon == 'work') {
      return Icons.work_outlined;
    }
    if (icon == 'gaming') {
      return Icons.gamepad_outlined;
    }
    if (icon == 'sleep') {
      return Icons.bed_outlined;
    }
    if (icon == 'others') {
      return CupertinoIcons.question_square;
    } else {
      return Icons.timer;
    }
  }

  CollectionReference todos = FirebaseFirestore.instance.collection('history');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
            backgroundColor: Colors.yellow,
            leading: IconButton(
              icon: Icon(Icons.list_outlined, color: Colors.black),
              onPressed: () => ZoomDrawer.of(context)!.toggle(),
            )),
        body: Container(
            child: Center(
                child: StreamBuilder(
          stream: todos.orderBy('date').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            return ListView(
              children: snapshot.data!.docs.map((todo) {
                return Center(
                    child: ListTile(
                        leading: Icon(iconLeading(todo['icon']),
                            color: Colors.black),
                        onTap: () {
                          openPage(history_details(todo['duration'].toString(),
                              todo['title'], todo['subtitle']));
                        },
                        title: Text(todo['title']),
                        subtitle: Text(todo['date'].toString()),
                        trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              todo.reference.delete();
                            })));
              }).toList(),
            );
          },
        ))));
  }
}
