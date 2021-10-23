import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timertask/pages/conclusion_page.dart';
import 'package:timertask/pages/todos_detail.dart';

class todo_page extends StatefulWidget {
  todo_page({Key? key}) : super(key: key);

  @override
  State<todo_page> createState() => _todo_pageState();
}

var collectionfiretodos =
    FirebaseFirestore.instance.collection('todos').snapshots();

final textcontroller = TextEditingController();
DateTime now = DateTime.now();

class _todo_pageState extends State<todo_page> {
  void openPage(where) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => where));
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

  @override
  Widget build(BuildContext context) {
    CollectionReference todos = FirebaseFirestore.instance.collection('todos');
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.orange,
            child: Icon(Icons.add),
            onPressed: () {
              openPage(conc_page(now.year, Icons.access_time_filled_sharp));
            }),
        backgroundColor: Colors.amber,
        appBar: AppBar(
            centerTitle: true,
            title:
                Text("To-dos", style: GoogleFonts.poppins(color: Colors.black)),
            backgroundColor: Colors.yellow,
            leading: IconButton(
              icon: Icon(Icons.list_outlined, color: Colors.black),
              onPressed: () => ZoomDrawer.of(context)!.toggle(),
            )),
        body: Center(
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
                          openPage(todos_detail(
                              todo['date'], todo['title'], todo['subtitle']));
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
        )));
  }
}
