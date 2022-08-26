// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:quizyz/model/Quiz.dart';
// import 'package:quizyz/service/config/api_service.dart';
// import 'package:quizyz/service/config/base_response.dart';
// import 'package:quizyz/service/quizzes_service.dart';
// import 'package:quizyz/utils/config/custom_shared_preferences.dart';
//
// class PlayBloc {
//   QuizzesService _service;
//
//   GlobalKey<FormState> formKey;
//   TextEditingController codeController;
//   TextEditingController nomeJogadorController;
//   StreamController<bool> _isLoggedController;
//   Stream<bool> get isLoggedStream => _isLoggedController.stream;
//   Sink<bool> get isLoggedSink => _isLoggedController.sink;
//   StreamController<BaseResponse<Quiz>> _playQuizController;
//   Stream<BaseResponse<Quiz>> get playQuizStream => _playQuizController.stream;
//   Sink<BaseResponse<Quiz>> get playQuizSink => _playQuizController.sink;
//
//   PlayBloc() {
//     _service = QuizzesService(APIService());
//     formKey = GlobalKey<FormState>();
//     _isLoggedController = StreamController.broadcast();
//     codeController = TextEditingController();
//     nomeJogadorController = TextEditingController();
//     _playQuizController = StreamController.broadcast();
//   }
//
//   Future getUsuarioLogin() async {
//     await CustomSharedPreferences.readUsuario().then((response) async {
//       isLoggedSink.add(response);
//     });
//   }
//
//   Future getUsuarioNome() async {
//     String nome;
//     await CustomSharedPreferences.readNomeUsuario().then((response) async {
//       nome = response;
//     });
//     return nome;
//   }
//
//   Future getQuiz({int cod}) async {
//     try {
//       playQuizSink.add(BaseResponse.loading());
//       Quiz response = await _service.getQuizById(cod: cod);
//       playQuizSink.add(BaseResponse.completed(data: response));
//     } catch (e, stackTrace) {
//       if (stackTrace != null) {
//         playQuizSink.add(BaseResponse.error("Esse quiz não existe!"));
//       } else {
//         playQuizSink.add(BaseResponse.error(e.toString()));
//       }
//     }
//   }
//
//   dispose() {
//     _isLoggedController.close();
//     _playQuizController.close();
//   }
// }
