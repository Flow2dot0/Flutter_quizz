import 'package:flutter/material.dart';
import 'package:flutter_quizz/quizzPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quizz Demo Page in BLoC'),
      ),
      body: Center(
        child: Container(
          child: Card(
              child: Container(
                height: MediaQuery.of(context).size.height/1.05,
                width: MediaQuery.of(context).size.width/1.02,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image.asset("assets/images/quizzLogo.jpg",
                      width: MediaQuery.of(context).size.width/1.3,
                    ),
                    FloatingActionButton(
                        onPressed: navToQuizz,
                        mini: true,
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.play_arrow),
                    )
                  ],
                ),
              )
          )
        ),
      )
    );
  }

  void navToQuizz() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return QuizzPage();
    }));
  }
}

//=//=//=//    logic   //=//=//=>
//go to the direction of the next screen and start to play