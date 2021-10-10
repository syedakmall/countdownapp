import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timertask/countdown_page.dart';

class homeBody extends StatefulWidget {
  homeBody({Key? key}) : super(key: key);

  @override
  _homeBodyState createState() => _homeBodyState();
}

var colorpriority = Colors.black;
var colorchores = Colors.black;
var colorstudy = Colors.black;
var colorwork = Colors.black;
var colorgaming = Colors.black;
var colorsleep = Colors.black;
var colorothers = Colors.black;


var colorCollection = [colorpriority, colorchores, colorstudy, colorwork,colorgaming, colorsleep,colorothers];


class _homeBodyState extends State<homeBody> {
  void openPage(where){Navigator.of(context).push(MaterialPageRoute(builder : (context) => where));}

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height : 25),

          Center(
            child : Text("Set The Timer", style : GoogleFonts.poppins(fontSize : 20, fontWeight: FontWeight.bold))
          )
          ,
          SizedBox(height : 25),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex : 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber[700],
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  margin: const EdgeInsets.only(left : 30, right : 30),
                  height : 103,
                  child : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left : 15.0, right : 15,),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Task Name",
                            hintStyle: GoogleFonts.poppins(color: Colors.black54)
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left : 15.0, right : 15),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Short Description",
                            hintStyle: GoogleFonts.poppins(color: Colors.black54)
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              )
            ],
          ), 
          SizedBox(height : 25),
          Padding(
            padding: const EdgeInsets.only(left : 20),
            child: Text("Task Type", style : GoogleFonts.poppins(color : Colors.black, fontSize: 16)),
          ),
          SizedBox(height : 20),
          tasktypes(),
          changeTime(),
          SizedBox(height : 70),

          
          Center(
            child: ElevatedButton(
              style : ElevatedButton.styleFrom(primary: Colors.teal[300]),
              onPressed: (){}, 
              child: GestureDetector(onTap: (){openPage(countdownPage());},child: Text("Start Timer" , style : GoogleFonts.poppins(fontWeight: FontWeight.w600)))
              
              ),
          )
        ],
      )
    );
  }
}



//changetime

class changeTime extends StatefulWidget {
  const changeTime({
    Key? key,
  }) : super(key: key);

  @override
  State<changeTime> createState() => _changeTimeState();
}

class _changeTimeState extends State<changeTime> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left : 30, right : 30),
      child: Expanded(
        flex : 1,
        child: Container(
          height : 190,
          child: Row(
            children: [
              SizedBox(width : 10),
              Expanded(
                flex : 1,
                child: Container(
                  height : 120,
                  child : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height : 20),
                      Text("00", style : GoogleFonts.poppins(color : Colors.black, fontSize: 40, fontWeight : FontWeight.bold)),
                      
                      Text("Hour", style : GoogleFonts.poppins(color : Colors.black, fontSize: 15, ))
                  ],)

                ),
              ),SizedBox(width : 10),
              Expanded(
                flex : 1,
                child: Container(
                  height : 120,
                  child : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height : 20),
                      Text("00", style : GoogleFonts.poppins(color : Colors.black, fontSize: 40, fontWeight : FontWeight.bold)),
                      Text("Minute", style : GoogleFonts.poppins(color : Colors.black, fontSize: 15, ))
                  ],),

                ),
              ),SizedBox(width : 10),
              Expanded(
                flex : 1,
                child: Container(
                  height : 120,
                  child : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height : 20),
                      Text("00", style : GoogleFonts.poppins(color : Colors.black, fontSize: 40, fontWeight : FontWeight.bold)),
                      Text("Second", style : GoogleFonts.poppins(color : Colors.black, fontSize: 15, ))
                  ],),

                ),
              ),
              SizedBox(width : 10),
          ],),
        ),
      ),
    );
  }
}


//tasktypes

class tasktypes extends StatefulWidget {
  const tasktypes({
    Key? key,
  }) : super(key: key);

  @override
  State<tasktypes> createState() => _tasktypesState();
}

class _tasktypesState extends State<tasktypes> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width : 35),
        Expanded(
          flex : 1,
          child: Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){setState(() {
                      colorpriority = Colors.green;
                      colorchores = Colors.black;
                      colorstudy = Colors.black;
                      colorwork = Colors.black;
                      colorgaming = Colors.black;
                      colorsleep = Colors.black;
                      colorothers = Colors.black;
                    });},
                    child: Container(
                      height :60, 
                      width : 60, 
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height :5),
                          Icon(Icons.star_border_outlined, color : colorpriority),
                          SizedBox(height : 5),
                          Text("Priority", style : GoogleFonts.poppins(fontSize: 12, color : colorpriority))
                        ]),
                    ),
                  ),
                  SizedBox(width : 20),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        colorpriority = Colors.black;
                      colorchores = Colors.green;
                      colorstudy = Colors.black;
                      colorwork = Colors.black;
                      colorgaming = Colors.black;
                      colorsleep = Colors.black;
                      colorothers = Colors.black;
                      });
                    },
                    child: Container(
                      height :60, 
                      width : 60, 
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height :5),
                          Icon(Icons.task_alt, color : colorchores),
                          SizedBox(height : 5),
                          Text("Chores", style : GoogleFonts.poppins(fontSize: 12, color : colorchores))
                        ],
                      ),
                    ),
                  ),SizedBox(width : 20),
                  GestureDetector(
                    onTap: (){setState(() {
                      colorpriority = Colors.black;
                      colorchores = Colors.black;
                      colorstudy = Colors.green;
                      colorwork = Colors.black;
                      colorgaming = Colors.black;
                      colorsleep = Colors.black;
                      colorothers = Colors.black;
                    });},
                    child: Container(
                      height :60, 
                      width : 60, 
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height :5),
                          Icon(Icons.school_outlined, color : colorstudy),
                          SizedBox(height : 5),
                          Text("Studying", style : GoogleFonts.poppins(fontSize: 12, color : colorstudy))
                        ]),
                    ),
                  ),SizedBox(width : 20),
                  GestureDetector(
                    onTap: (){setState(() {
                      colorpriority = Colors.black;
                      colorchores = Colors.black;
                      colorstudy = Colors.black;
                      colorwork = Colors.green;
                      colorgaming = Colors.black;
                      colorsleep = Colors.black;
                      colorothers = Colors.black;});},
                    child: Container(
                      height :60, 
                      width : 60, 
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height :5),
                          Icon(Icons.work_outline_sharp, color : colorwork),
                          SizedBox(height : 5),
                          Text("Work", style : GoogleFonts.poppins(fontSize: 12, color : colorwork))
                        ]),
                    ),
                  ),SizedBox(width : 20),
                  GestureDetector(
                    onTap: (){setState(() {
                      colorpriority = Colors.black;
                      colorchores = Colors.black;
                      colorstudy = Colors.black;
                      colorwork = Colors.black;
                      colorgaming = Colors.green;
                      colorsleep = Colors.black;
                      colorothers = Colors.black;
                    });},
                    child: Container(
                      height :60, 
                      width : 60, 
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height :5),
                          Icon(Icons.gamepad_outlined, color : colorgaming),
                          SizedBox(height : 5),
                          Text("Gaming", style : GoogleFonts.poppins(fontSize: 12, color : colorgaming))
                        ]),
                    ),
                  ),SizedBox(width : 20),
                  GestureDetector(
                    onTap: (){setState(() {
                      colorpriority = Colors.black;
                      colorchores = Colors.black;
                      colorstudy = Colors.black;
                      colorwork = Colors.black;
                      colorgaming = Colors.black;
                      colorsleep = Colors.green;
                      colorothers = Colors.black;
                    });},
                    child: Container(
                      height :60, 
                      width : 60, 
                       child: Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height :5),
                          Icon(Icons.bed_outlined, color : colorsleep),
                          SizedBox(height : 5),
                          Text("Sleep", style : GoogleFonts.poppins(fontSize: 12, color : colorsleep))
                        ]),
                    ),
                  ),SizedBox(width : 20),
                  GestureDetector(
                    onTap : (){setState(() {
                      colorpriority = Colors.black;
                      colorchores = Colors.black;
                      colorstudy = Colors.black;
                      colorwork = Colors.black;
                      colorgaming = Colors.black;
                      colorsleep = Colors.black;
                      colorothers = Colors.green;
                    });},
                    child: Container(
                      height :60, 
                      width : 60, 
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height :5),
                          Icon(CupertinoIcons.question_square, color : colorothers),
                          SizedBox(height : 5),
                          Text("Others", style : GoogleFonts.poppins(fontSize: 12, color : colorothers))
                        ]),
                    ),
                  ),
                  SizedBox(width : 20),
                ],
              ),
            ),
            
          ),
        )
      ],
    );
  }
}