import 'package:flutter/material.dart';
import 'package:gp_ent/widgets/answer.dart';
import '../data/qData.dart';

class QScreen extends StatefulWidget {
  @override
  State<QScreen> createState() => _QScreenState();
}

class _QScreenState extends State<QScreen> {
  //     Icon(Icons.check_circle, color: Colors.green),
  List<Icon> _scoreTracker = [];
  int _questionIndex = 0;
  int _totalScore = 0;
  bool ansSelected = false;
  bool endOfQuiz = false;
  bool correctAnsSelected = false;

  void _questionAnswered(bool answerScore) {
    setState(() {
      // ans was selected
      ansSelected = true;
      if (answerScore) {
        _totalScore++;
        correctAnsSelected = true;
      }
      // add score tracker
      _scoreTracker.add(
        answerScore
            ? Icon(Icons.check_circle, color: Colors.green)
            : Icon(Icons.check_circle, color: Colors.red),
      );
    });
    // quiz ends
    if (_questionIndex + 1 == questions.length) {
      endOfQuiz = true;
    }
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex++;
      ansSelected = false;
      correctAnsSelected = false;
    });
    // end of the quiz
    if (_questionIndex >= questions.length) {
      _resetQuiz();
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _scoreTracker = [];
      endOfQuiz = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: [
              if (_scoreTracker.length == 0)
                SizedBox(
                  height: 25.0,
                ),
              if (_scoreTracker.length > 0) ..._scoreTracker
            ],
          ),
          Container(
            width: double.infinity,
            height: 150.0,
            margin: EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text(
                questions[_questionIndex]['question'].toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ...(questions[_questionIndex]['answers'] as List<Map<String, Object>>)
              .map((answer) => Answer(
                    answerText: answer['answerText'].toString(),
                    answerColor: ansSelected
                        ? answer['score'] == true
                            ? Colors.green
                            : Colors.red
                        : Colors.transparent,
                    answerTap: () {
                      // if ans selected - no more taps
                      if (ansSelected) {
                        return;
                      }
                      _questionAnswered(answer['score'] == true ? true : false);
                    },
                  )),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 40.0)),
            onPressed: () {
              if (ansSelected == false) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Please select an answer'),
                ));
                return;
              }
              _nextQuestion();
            },
            child: Text(endOfQuiz ? 'Restart' : 'Next'),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              '${_totalScore.toString()}/${questions.length}',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (ansSelected && !endOfQuiz)
            Container(
              height: 60,
              width: double.infinity,
              color: correctAnsSelected ? Colors.green : Colors.red,
              child: Center(
                child: Text(
                  correctAnsSelected ? 'You got it right !' : 'Wrong Ans',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          if (endOfQuiz)
            Container(
              height: 60,
              width: double.infinity,
              color: Colors.black,
              child: Center(
                child: Text(
                  _totalScore > 6
                      ? 'Congratulations! Score: $_totalScore'
                      : 'Better luck next time: Score: $_totalScore',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: (_totalScore > 7) ? Colors.white : Colors.red,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
