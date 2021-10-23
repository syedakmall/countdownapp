import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:timertask/classes/mitems.dart';
import 'package:timertask/home_body.dart';
import 'package:timertask/menu.dart';
import 'package:timertask/pages/history_page.dart';
import 'package:timertask/pages/settings_page.dart';
import 'package:timertask/pages/todo_page.dart';
import 'home_body.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MaterialApp(debugShowCheckedModeBanner: false,home : MyApp()));
}

class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}
  
  MenuItem currentItem = MenuItems.timer;

  Widget getScreen() {
    switch(currentItem){
      case MenuItems.timer : return homeBody();
      case MenuItems.history : return history_page();
      case MenuItems.todo : return todo_page();
      default  : return homeBody();
    }
  }


class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => ZoomDrawer(
    backgroundColor: Colors.amberAccent,
    borderRadius: 40,
    showShadow: true,
    style: DrawerStyle.Style1,
    mainScreen: getScreen(),
    menuScreen: Builder(
      builder: (context) {
        return appbar(
          currentItem : currentItem,
          onSelecteditem : (item){
            setState(() {
              currentItem = item;
              ZoomDrawer.of(context)!.close();
            });

          }
        );
      }
    ),
  );
}