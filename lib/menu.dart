import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:timertask/classes/mitems.dart';

class appbar extends StatefulWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelecteditem;

  appbar({
    Key? key,
    required this.currentItem,
    required this.onSelecteditem,
  }) : super(key: key);

  @override
  _appbarState createState() => _appbarState();
}

class MenuItems {
  static const timer = MenuItem('Timer', Icons.lock_clock_outlined);
  static const history = MenuItem('History', Icons.history);
  static const todo = MenuItem('To-dos', Icons.today_rounded);

  static const all = [timer, history, todo,];
}

class _appbarState extends State<appbar> {
  Widget buildmenuitems(item) {
    return ListTileTheme(
      selectedColor: Colors.black,
      child: ListTile(
        selected: widget.currentItem == item,
        minLeadingWidth: 20,
        leading: Icon(item.icon),
        title: Text(item.title, style: GoogleFonts.poppins()),
        onTap: () {setState(() {
          widget.onSelecteditem(item);
        });},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.amber[700],
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              ...MenuItems.all.map(buildmenuitems).toList(),
              const Spacer(flex: 2)
            ],
          ),
        ),
      ),
    );
  }
}
