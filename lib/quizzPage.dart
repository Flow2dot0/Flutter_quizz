import 'package:flutter/material.dart';
import 'package:flutter_quizz/homePage.dart';
import 'dart:async';
import 'package:flutter_quizz/questionToAnswer.dart';

class QuizzPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuizzPageState();
  }
}

class _QuizzPageState extends State<QuizzPage> {

  int _statusIndicator = 0;
  int _counterQuestion = 1;
  int _statusScore = 0;

  bool answerStatus;
  bool valuePressed;

  var myList = {
    "1" : QuestionToAnswer("", "Flutter est-il l'avenir ?", true),
    "2" : QuestionToAnswer("", "Redux est le meilleur state management pour Flutter ?", false),
    "3" : QuestionToAnswer("", "React Native est mieux que Flutter ?", false),
    "4" : QuestionToAnswer("", "Google est-il le créateur de Flutter SDK ?", true),
    "5" : QuestionToAnswer("", "Le plus dur à apprendre comme state management est BLoC ?", true),
    "6" : QuestionToAnswer("", "Veux-tu devenir AL ?", true),
    "7" : QuestionToAnswer("", "D'après toi vas tu réussir ?", true),
    "8" : QuestionToAnswer("", "The Umbrella est la série que tu suis actuellement sur Netflix ?", true),
    "9" : QuestionToAnswer("", "Considères-tu le manga Kengan comme le successeur de StreetFright ?", true),
    "10" : QuestionToAnswer("", "Détestes-tu sur Dragon Ball ?", false)
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Quizz running'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(40),
            height: MediaQuery.of(context).size.height/1.05,
            width: MediaQuery.of(context).size.width/1.02,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _ProgressIndicator(),
                Text('$_statusScore / 10'),
                _cardQuestionCreator(
                    10.0,
                    "https://techcrunch.com/wp-content/uploads/2019/05/Screen-Shot-2019-05-01-at-9.19.45-AM.png",
                    myList["$_counterQuestion"].question
                ),
              ],
          )
        ),
      ),
    );
  }


  Card _cardQuestionCreator(double padding, String imageUrl, String question) => Card(
    child: Container(
      height: MediaQuery.of(context).size.height/1.5,
      padding: EdgeInsets.all(padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('QUESTION : $_counterQuestion',
            textScaleFactor: 2,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            height: 2,
          ),
          Image.network(imageUrl),
          Divider(
            height: 2,
          ),
          Text(question,
            textScaleFactor: 1.5,
            style: TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.italic
            ),
          ),
          Divider(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                  color : Colors.green,
                  onPressed:  () {
                    if(myList["$_counterQuestion"].answer==true) {
                      _resultModal(true);
                      _statusScore++;
                    } else {
                      _resultModal(false);
                    }
                  },
                  child: Text('Vrai',
                    textScaleFactor: 1.25,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  )
              ),
              Container(color: Colors.grey[200], height: 50, width: 1,),
              FlatButton(
                  color: Colors.red,
                  onPressed: () {
                    if(myList["$_counterQuestion"].answer==false) {
                      _resultModal(true);
                      _statusScore++;
                    } else {
                      _resultModal(false);
                    }
                  },
                  child: Text('Faux',
                    textScaleFactor: 1.25,
                    style: TextStyle(
                        color: Colors.white
                    ),
                  )
              ),
            ],
          )
        ],
      ),
    ),
  );

  Future<Null> _resultModal(bool isTrueOrFalse) async {
    return (
      showDialog(
          context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
            if(_statusIndicator==90) {
              return SimpleDialog(
                contentPadding: EdgeInsets.all(10),
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('END', style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Score final : $_statusScore / 10')
                      ],
                    ),
                  ),
                  RaisedButton(
                    color : Colors.blue,
                    onPressed: () {
                      navToHome();
                    },
                    child: Text('Suivant',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              );
            } else {
              return SimpleDialog(
                contentPadding: EdgeInsets.all(10),
                children: <Widget>[
                  (isTrueOrFalse==true? Image.asset("assets/images/win.png", height: 200,) : Image.asset("assets/images/fail.png", height: 200,)),
                  RaisedButton(
                    color : Colors.blue,
                    onPressed: () {
                      //faire if else pour passer à un modal de score et revenir à la homepage
                      Navigator.pop(context);
                      _statusIndicator += 10;
                      setState(() {
                        _counterQuestion++;
                      });
                    },
                    child: Text('Suivant',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              );
            }
        }
      )
    );
  }

  PreferredSize _ProgressIndicator() => PreferredSize(
      preferredSize: Size(double.infinity, 4.0),
      child: SizedBox(
          height: 4.0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Slider(
                value: _statusIndicator.toDouble(),
                min: 0.0,
                max: 100.0,
                divisions: 10,
                inactiveColor: Colors.blue,
                activeColor: Colors.tealAccent,
                onChanged: (double value) {
                }
            ),
          )
      )
  );

  void navToHome() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return HomePage();
    }));
  }
}

