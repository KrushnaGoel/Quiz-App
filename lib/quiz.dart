import'package:flutter/material.dart';
import 'package:quiznew/data/questions.dart';
import 'package:quiznew/start_screen.dart';
import 'package:quiznew/questions_screen.dart';
import 'package:quiznew/results_screen.dart';
class Quiz extends StatefulWidget
{
  const Quiz({super.key});
  @override
  State<Quiz> createState()
  {
    return _QuizState();
  }
}
class _QuizState extends State<Quiz>
{
  List <String> selectedAnswers = [];
  var activeScreen='start-screen';
  void switchScreen()
  {
    setState(()
    {
      activeScreen='questions-screen';
    }
    );
  }
  void chooseAnswer(String answer)
  {
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length)
    {
      setState(() {
        //selectedAnswers=[];
        activeScreen='results-screen';
      });
    }
  }

  void restartQuiz()
  {
    setState(() {
      selectedAnswers = [];
      activeScreen='questions-screen';
    });
  }
  
  @override
  Widget build(context)
  {
    Widget screenWidget = StartScreen(switchScreen);
    if(activeScreen == 'questions-screen')
    {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer,);
    }
    if(activeScreen == 'results-screen')
    {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
        );
    }
    return MaterialApp(
      home:Scaffold(
        body : Container(
          decoration:const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 7, 12, 114),
                Color.fromARGB(255, 9, 22, 169)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
          ),
          //child: Image.asset('quiz-logo.png'),
        ),
      );
  }
}