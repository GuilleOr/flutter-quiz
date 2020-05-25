import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

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
      'question': 'what\' your favorite color?',
      'answer': [
        {'text': 'red', 'score': 4},
        {'text': 'green', 'score': 6},
        {'text': 'black', 'score': 7},
        {'text': 'blue', 'score': 8}
      ],
    },
    {
      'question': 'what\' your favorite animal',
      'answer': [
        {'text': 'dog', 'score': 1},
        {'text': 'cat', 'score': 3},
        {'text': 'rabbit', 'score': 5},
        {'text': 'elephant', 'score': 8}
      ],
    },
    {
      'question': 'who\'s your favorite instructor',
      'answer': [
        {'text': 'max', 'score': 5},
        {'text': 'max', 'score': 5},
        {'text': 'max', 'score': 5},
        {'text': 'max', 'score': 5}
      ],
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('we have more questions');
    } else {
      print('we don\'t have more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('hola desde el build' + _questionIndex.toString());

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('my first app'),
          ),
          body: Container(
            child: _questionIndex < _questions.length
                ? Quiz(
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                    questions: _questions,
                  )
                : Result(_totalScore, resetQuiz),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.red, Colors.orange])),
          )),
    );
  }
}
