import 'package:flutter/material.dart';
import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

class countdownPage extends StatefulWidget {
  //String title ="";
  //int countdowntimeinseconds =  0;
  //String desc = "";
  countdownPage({Key? key}) : super(key: key); // create constructor later

  @override
  _countdownPageState createState() => _countdownPageState();
}


class _countdownPageState extends State<countdownPage> {

  bool _isRunning = false;
  final CountDownController _controller = CountDownController();

  int _duration = 10;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color : Colors.black)),centerTitle: true,title: Text("Tajuk here", style : GoogleFonts.poppins(color : Colors.black, fontWeight: FontWeight.w600)),backgroundColor:Colors.yellow),
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
                    duration: 100,
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
                      _controller.resume();
                    } else {
                      _controller.pause();
                    }

                    _isRunning = !_isRunning;
                  }),
                
                  child: Container(
                    width : 80,
                    height : 60,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color : Colors.white ),
                    child : Icon(_isRunning ? Icons.play_arrow : Icons.pause),
                  
                  ),
                ),
               
              ],
            ),
          ),
          
        ),
      );
    
  }
}
