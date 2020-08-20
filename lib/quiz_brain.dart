import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'score_keeper.dart';

class QuizBrain {
  //count to track question number
  int _questionNumber = 0;

  //number of correct answers of player
  int _score = 0;

  //list to hold icons to show results of right and wrong after each question
  ScoreKeeper _scoreKeeper = ScoreKeeper();

  List<Question> _questions = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  /*     GETTERS     */

  //get scoreKeeper to transfer to main...
  ScoreKeeper get scoreKeeper => _scoreKeeper;

  //get question number
  int get questionNumber => _questionNumber;

  //get list of questions - flutter style
  List<Question> get questions => _questions;

  //old school get specific question text
  String getQuestionText(int questionNumber) {
    return _questions[questionNumber].questionText;
  }

  //old school get specific question answer
  bool getQuestionAnswer(int questionNumber) {
    return _questions[questionNumber].questionAnswer;
  }

/*    SETTERS    */

  //Set question number
  set questionNumber(int value) {
    _questionNumber = value;
  }

  //Change question text
  void setQuestionText(int questionNumber, String text) {
    _questions[questionNumber].questionText = text;
  }

  String displayQuestionText() {
    if (_questionNumber < _questions.length) {
      return _questions[_questionNumber].questionText;
    } else {
      return "You have completed all of the questions in this quiz.";
    }
  }

  //run question new
  void runQuestion(bool answer, BuildContext context) {
    //get correct answer
    bool correctAnswer = _questions[_questionNumber].questionAnswer;

    //update correct icon in list
    if (answer == correctAnswer) {
      _scoreKeeper.add(_scoreKeeper.setIcon(Colors.green, Icons.check));
      _score++;
    } else {
      _scoreKeeper.add(_scoreKeeper.setIcon(Colors.red, Icons.clear));
    }

    //update counter
    _questionNumber++;
    if (_questionNumber == questions.length) {
      resetQuiz(context);
    }
  }

  void resetQuiz(context) {
    _questionNumber = 0;
    _scoreKeeper.scoreKeeper = [];
    runAlert(context);
    _score = 0;
    print('No more questions in your list.');
  }

  void runAlert(context) {
    Alert(
      context: context,
      title: "That's the end!",
      style: AlertStyle(animationType: AnimationType.grow),
      desc: "Your final score was $_score.",
      buttons: [
        DialogButton(
          child: Text(
            "RESTART QUIZ",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ).show();
  }
}
