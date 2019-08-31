import 'package:flutter/material.dart';

class AppBarBottomProgressIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppBarBottomProgressIndicator();
  }

}

class _AppBarBottomProgressIndicator extends State<AppBarBottomProgressIndicator> {

  int progressCursorPosition = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

  PreferredSize _createProgressIndicator() => PreferredSize(
      preferredSize: Size(double.infinity, 4.0),
      child: SizedBox(
          height: 4.0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Slider(
                value: progressCursorPosition.toDouble(),
                min: 0.0,
                max: 100.0,
                divisions: 10,
                inactiveColor: Colors.blue,
                activeColor: Colors.tealAccent,
                onChanged: (double value) {
                  setState(() {
                    progressCursorPosition = value.toInt();
                  });
                }
            ),
          )
      )
  );
}

