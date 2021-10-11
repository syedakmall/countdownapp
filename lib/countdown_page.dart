import 'package:flutter/material.dart';
import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timertask/home_body.dart';
import 'package:timertask/main.dart';

class countdownPage extends StatefulWidget {
  String title = "";
  int countdowntimeinseconds = 0;
  String desc = "";

  countdownPage(this.desc, this.title, this.countdowntimeinseconds);

  @override
  _countdownPageState createState() => _countdownPageState();
}

class _countdownPageState extends State<countdownPage> {
  void openPage(where){Navigator.of(context).push(MaterialPageRoute(builder : (context) => where));}
  bool _isRunning = true;
  final CountDownController _controller = CountDownController();


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
            ],
          ),
        ),
      ),
    );
  }
}
