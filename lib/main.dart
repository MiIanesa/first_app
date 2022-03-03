import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Cual es tu jugador favorito',
      'answers': [
        {'text': 'Messi', 'score': 10},
        {'text': 'Maradona', 'score': 5},
        {'text': 'Ronaldinho', 'score': 3},
        {'text': 'CR7', 'score': 1},
      ],
    },
    {
      'questionText': 'Cual es tu animal favorito',
      'answers': [
        {'text': 'Conejo', 'score': 3},
        {'text': 'Leprechaun', 'score': 11},
        {'text': 'Elefante', 'score': 5},
        {'text': 'Leon', 'score': 9},
      ],
    },
    {
      'questionText': 'Cual es tu comida favorita',
      'answers': [
        {'text': 'Milanesas', 'score': 1},
        {'text': 'Milanesas', 'score': 1},
        {'text': 'Milanesas', 'score': 1},
        {'text': 'Milanesas', 'score': 1},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
