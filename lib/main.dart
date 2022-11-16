import 'package:flutter/material.dart';
import 'package:my_app/QuestionList.dart';
import './answers.dart';
import './questions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Quiz_App();
  }
}

class Quiz_App extends State<MyApp> {
  int listIndex = 0;
  int totalScore = 0;
  bool end = false;

  Widget build(BuildContext context) {
    var questions_answers = questionsList.ListOfQuestions;
    void clickHandler(score) {
      if (listIndex < questions_answers.length - 1) {
        // print(score);
        setState(() {
          listIndex = listIndex + 1;
          int helper = score;
          totalScore = totalScore + helper;
        });
      } else {
        setState(() {
          int helper = score;
          totalScore = totalScore + helper;
          end = true;
          listIndex = 0;
        });
      }
    }

    void skipClipHandler() {
      if (listIndex < questions_answers.length - 1) {
        setState(() {
          listIndex = listIndex + 1;
          end = false;
        });
      } else {
        setState(() {
          listIndex = 0;
          totalScore = 0;
          end = true;
        });
      }
    }

    void resetQueze() {
      setState(() {
        listIndex = 0;
        end = false;
        totalScore = 0;
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
          backgroundColor: Colors.black,
        ),
        body: end
            ? Container(
                height: 200.0,
                margin: EdgeInsets.only(top: 200.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Center(
                          child: Text(
                        'You scored $totalScore',
                        style: const TextStyle(fontSize: 35),
                      )),
                    ),
                    ElevatedButton(
                      onPressed: resetQueze,
                      child: const Text("restart Quiz",
                          style: TextStyle(fontSize: 24, color: Colors.black)),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  Quiz_questions(
                      questions_answers[listIndex]['question'] as String,
                      listIndex),
                  ...(questions_answers[listIndex]['answers']
                          as List<Map<String, Object>>)
                      .map((answer) {
                    return Answers(
                        clickHandler: () => clickHandler(answer['score']),
                        optionText: answer['option']);
                  }),
                  Container(
                    // width: 100.0,
                    margin: EdgeInsets.only(top: 10.0),
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      border: Border.all(
                        width: 3,
                        color: Colors.black,
                      ),
                    ),
                    child: Text('your score $totalScore'),
                  )
                ],
              ),
        backgroundColor: Colors.white54,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Colors.white,
          child: Container(
              height: 40.0,
              child: Container(
                // child: Text("The brain wiser"),
                color: Colors.black26,
              )),
        ),
        floatingActionButton: end
            ? FloatingActionButton(
                onPressed: resetQueze,
                tooltip: 'Reset Quiz',
                child: const Icon(Icons.restart_alt))
            : FloatingActionButton(
                onPressed: skipClipHandler,
                tooltip: 'Skip question',
                child: const Icon(Icons.skip_next),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
