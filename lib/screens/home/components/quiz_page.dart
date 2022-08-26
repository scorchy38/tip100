import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/screens/home/home_page.dart';

class QuizPage extends StatefulWidget {
  Map? payLoad;
  Map? scorePayLoad;

  String? type;
  QuizPage({Key? key, this.payLoad, this.type, this.scorePayLoad})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuizPageState();
  }
}

class _QuizPageState extends State<QuizPage> {
  List<Map<String, Object>> _questions = [];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) async {
    _totalScore += score;
    if (_questionIndex < _questions.length - 1)
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    else {
      Navigator.pop(context);
      Navigator.pop(context);
      Fluttertoast.showToast(msg: 'Tip has been submitted anonymously!');
      var options = BaseOptions(
        connectTimeout: 100000,
        receiveTimeout: 100000,
      );
      Dio dio = Dio(options);
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      Response response = await dio.post('https://tip100.herokuapp.com/addTip',
          data: widget.payLoad);

      print("Loading");
      try {
        Response response2 =
            await dio.post('http://192.168.137.1:5000/get_Trust_Score',
                // 'http://127.0.0.1:5000/get_Trust_Score',
                data: widget.scorePayLoad
                // data: {
                //   "crime": context
                //       .read<AddCaseBloc>()
                //       .state
                //       .crimeType,
                //   "text": summaryController.text,
                //   "state": "Pondicherry",
                //   "tipIndex": "3",
                //   "district": "Pondicherry",
                //   if (audioURL != "") "audio": audioURL,
                //   if (fileURL != "") "video": fileURL,
                // }
                );
        print(response2.data);
      } catch (e) {
        print(e);
      }
      // if (response.data['message'] ==
      //     'A block is MINED') {
      //
      //   Navigator.pop(context);
      // }

    }
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => HomePage()));
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print("We have more questions!");
    } else {
      print('No more questions!');
    }
  }

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  void loadQuestions() async {
    List<Map<String, Object>> questions = [];
    DocumentSnapshot<Map<String, dynamic>> doc = await firebaseFirestore
        .collection("mentalAwarenessQuestions")
        .doc(widget.type)
        .get();
    print(widget.type);
    log(doc.data().toString());
    doc.data()?.entries.forEach((element) {
      Map answers = element.value;
      List<Map<String, Object>> answersArray = [];
      answers.forEach((key, value) {
        answersArray.add({'text': key, 'score': int.parse(value)});
      });
      questions.add({
        'questionText': element.key,
        'answers': answersArray,
      });
    });
    log(questions.toString());
    setState(() {
      _questions = questions;
    });
  }

  @override
  void initState() {
    loadQuestions();
    if (widget.type == "Assault") {
      _questions = const [
        {
          'questionText':
              'If someone hits you or abuse you with or without resource you would',
          'answers': [
            {'text': 'Ask for help', 'score': 10},
            {'text': 'Fight him back', 'score': 5},
            {'text': 'Report to police', 'score': 10},
            {'text': 'Run away', 'score': 5}
          ],
        },
        {
          'questionText':
              'What do you think about moblynching because of religious disagreement?',
          'answers': [
            {'text': 'It is situation dependant', 'score': 5},
            {'text': 'It should be supported', 'score': 0},
            {'text': 'Moblynchers should be punished', 'score': 10},
            {'text': 'Police should take charge about it', 'score': 8}
          ],
        },
        {
          'questionText': "Is threatening someone's life a crime?",
          'answers': [
            {'text': 'It is very common', 'score': 3},
            {'text': 'No', 'score': 0},
            {'text': 'Situation dependant', 'score': 3},
            {'text': 'Yes', 'score': 10}
          ],
        },
        {
          'questionText': 'What do you think about violence',
          'answers': [
            {'text': 'It is situation dependant', 'score': 3},
            {'text': 'It should be supported', 'score': 0},
            {
              'text': 'People promoting the same should be punished',
              'score': 10
            },
            {'text': 'Something which I am totally against', 'score': 10}
          ],
        },
        {
          'questionText': 'Hitting someone during an argument is',
          'answers': [
            {'text': 'Is a crime', 'score': 8},
            {'text': 'Is fine', 'score': 0},
            {'text': 'Reported to the police', 'score': 10},
            {'text': 'Should be discouraged', 'score': 8}
          ],
        },
        {
          'questionText': 'Actions taken against violence',
          'answers': [
            {'text': 'Should be less harsh for female or children', 'score': 5},
            {'text': 'Should not consider age or gender', 'score': 10},
            {'text': 'Should not be taken', 'score': 0},
            {'text': 'Should not be harsh', 'score': 3}
          ],
        },
      ];
    } else if (widget.type == "Drugs") {
      _questions = const [
        {
          'questionText': 'Having drugs is a __',
          'answers': [
            {'text': 'Crime', 'score': 10},
            {'text': 'Good recreation', 'score': 0},
            {'text': 'Personal preference', 'score': 2},
            {'text': 'Threat to the society', 'score': 8}
          ],
        },
        {
          'questionText':
              'How would you prevent a drug related activity in your area?',
          'answers': [
            {'text': 'Be the part of anti drug NGOS', 'score': 8},
            {
              'text': 'Find and take actions against the distributor',
              'score': 3
            },
            {'text': 'Spread awareness', 'score': 10},
            {'text': 'Would rather promote it', 'score': 0}
          ],
        },
        {
          'questionText':
              'If you witnessed a drug exchange or have information about it, What would you do?',
          'answers': [
            {'text': 'Get involved in the same', 'score': 0},
            {'text': "Ignore for your family's safety", 'score': 3},
            {'text': 'Report anonymously on TIP100', 'score': 10},
            {'text': 'Report at the nearest police station', 'score': 5}
          ],
        },
        {
          'questionText': 'On what basis you can say that someone is on drugs?',
          'answers': [
            {'text': 'Guess', 'score': 3},
            {'text': 'Saw him buying', 'score': 8},
            {'text': 'Suspicious behaviour', 'score': 5},
            {'text': 'Witnessed them using drugs', 'score': 10}
          ],
        },
        {
          'questionText': 'Which of the following is a crime?',
          'answers': [
            {'text': 'All', 'score': 5},
            {'text': 'Distributing marijuana for free', 'score': 8},
            {'text': 'Manufacturing drugs', 'score': 10},
            {'text': 'Possessing drugs', 'score': 5}
          ],
        },
      ];
    } else if (widget.type == "Rape") {
      _questions = [
        {
          'questionText': 'Consent before having an intercourse is',
          'answers': [
            {'text': 'Important', 'score': 10},
            {'text': 'Irrelevant', 'score': 0},
            {'text': 'Personal choice', 'score': 2},
            {'text': 'No comment', 'score': 1}
          ],
        },
        {
          'questionText': 'Post-marital sex is',
          'answers': [
            {'text': 'A rape', 'score': 1},
            {'text': 'Never a rape', 'score': 3},
            {'text': 'None of my buisiness', 'score': 3},
            {'text': 'Rape if done forcefully', 'score': 10}
          ],
        },
        {
          'questionText':
              'Taking advantage of someone when they are under influence',
          'answers': [
            {'text': 'Is a crime', 'score': 10},
            {'text': "Is fine if the person doesn't resist", 'score': 3},
            {'text': 'Is not a big deal', 'score': 0},
            {'text': 'Is punishable', 'score': 8}
          ],
        },
        {
          'questionText': 'Threat to rape should be',
          'answers': [
            {'text': 'Handled by threatening the person back', 'score': 0},
            {'text': 'Ignored', 'score': 3},
            {'text': 'Reported to police', 'score': 10},
            {'text': 'Taken seriously', 'score': 8}
          ],
        },
        {
          'questionText': 'Who can be a victim of sexual assaultment?',
          'answers': [
            {'text': 'Anyone irrespective of gender and age', 'score': 10},
            {'text': 'Female', 'score': 8},
            {'text': 'Male', 'score': 5},
            {'text': 'Minor', 'score': 5}
          ],
        },
      ];
    }

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _questions.isEmpty
            ? Center(
                child: SizedBox(
                    height: 50, width: 50, child: CircularProgressIndicator()))
            : Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              ));
  }
}

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.questionIndex});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 250,
          ),
          Center(
              child: Question(
                  questions[questionIndex]!['questionText'].toString())),
          ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
              .map((answer) {
            return Answer(() => answerQuestion(answer['score']),
                answer!['text'].toString());
          }).toList(),
        ],
      ),
    );
  }
}

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Center(
        child: Text(
          questionText,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontSize: 23,
              color: AppColors.primary,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.primary),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: Text(answerText),
          onPressed: () {
            selectHandler();
          },
        ),
      ),
    );
  }
}
