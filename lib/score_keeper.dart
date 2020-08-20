import 'package:flutter/cupertino.dart';

class ScoreKeeper {
  //list to hold icons to show score at the bottom of the page
  List<Icon> _scoreKeeper = [];

  //add method
  void add(Icon icon) {
    _scoreKeeper.add(icon);
  }

  //create icon used in scoreKeeper after an answer is given
  Icon setIcon(Color color, final icon) {
    return Icon(
      icon,
      color: color,
    );
  }

  //Getter to update scoreKeeper every time a question is answered
  List<Icon> get scoreKeeper => _scoreKeeper;

//setter for reset
  set scoreKeeper(List<Icon> value) {
    _scoreKeeper = value;
  }
}
