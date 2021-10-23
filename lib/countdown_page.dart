import 'package:flutter/material.dart';
import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timertask/home_body.dart';
import 'package:timertask/main.dart';
import 'package:timertask/pages/conclusion_page.dart';

class countdownPage extends StatefulWidget {
  String title = "";
  int countdowntimeinseconds = 0;
  String desc = "";
  IconData icon;

  countdownPage(this.desc, this.title, this.countdowntimeinseconds, this.icon);

  @override
  _countdownPageState createState() => _countdownPageState();
}

class _countdownPageState extends State<countdownPage> {
  void openPage(where) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => where));
  }

  bool _isRunning = true;
  final CountDownController _controller = CountDownController();

  void openTodo(context) {
    var dialog = AlertDialog(
      backgroundColor: Colors.amber,
      title: Text("Create A To-do?",
          style: GoogleFonts.poppins(color: Colors.black)),
      actions: [
        TextButton(
            onPressed: () {
              openPage(MyApp());
            },
            child: Text("No", style: GoogleFonts.poppins(color: Colors.red))),
        TextButton(
            onPressed: () {
              openPage(conc_page((widget.countdowntimeinseconds), widget.icon));
            },
            child:
                Text("Yes", style: GoogleFonts.poppins(color: Colors.green))),
      ],
    );

    showDialog(
        context: context,
        builder: (context) {
          return dialog;
        });
  }

  void timerStopDialog(context) {
    var dialog = AlertDialog(
      backgroundColor: Colors.amber,
      title: Text("Stop The Timer",
          style: GoogleFonts.poppins(color: Colors.black)),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop('dialog');
            },
            child: Text("No", style: GoogleFonts.poppins(color: Colors.red))),
        TextButton(
            onPressed: () {
              openTodo(context);
            },
            child:
                Text("Yes", style: GoogleFonts.poppins(color: Colors.green))),
      ],
    );

    showDialog(
        context: context,
        builder: (context) {
          return dialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.black)),
          centerTitle: true,
          title: Text(widget.title,
              style: GoogleFonts.poppins(
                  color: Colors.black, fontWeight: FontWeight.w600)),
          backgroundColor: Colors.yellow),
      body: Container(
        color: Colors.amber,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: CountDownProgressIndicator(
                  controller: _controller,
                  valueColor: Colors.orange,
                  backgroundColor: Colors.black,
                  initialPosition: 0,
                  duration: widget.countdowntimeinseconds,
                  timeFormatter: (seconds) {
                    return Duration(seconds: seconds)
                        .toString()
                        .split('.')[0]
                        .padLeft(8, '0');
                  },
                  onComplete: () => null,
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => setState(() {
                  if (_isRunning) {
                    _controller.pause();
                  } else {
                    _controller.resume();
                  }
                  _isRunning = !_isRunning;
                }),
                child: Container(
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Icon(_isRunning ? Icons.pause : Icons.play_arrow),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 80),
                  height: 100,
                  width: 300,
                  child: Text(widget.desc,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 20,
                      ))),
              ElevatedButton(
                  onPressed: () {
                    timerStopDialog(context);
                  },
                  child: Text("Done",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold)))
            ],
          ),
        ),
      ),
    );
  }
}
