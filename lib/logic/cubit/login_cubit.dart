// import 'package:tip100/model/app_user_model.dart';
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
//
// part 'login_state.dart';
//
// class LoginCubit extends Cubit<LoginState> {
//   AppUserModel userDetails;
//   LoginCubit(this.userDetails) : super(LoginInitial());
//   Future loginUser(String username,String password) async {
//     final SharedPreferences _prefs = await SharedPreferences.getInstance();
//     var response = await http.get(Uri.parse(
//         'https://nextopay.com/uploop/thistory?userid=${_prefs.get('user_id')}'));
//     if (json.decode(response.body)['status'] == '1') {
//       var jsonlist = json.decode(response.body)['data'] as List;
//       listofdata.clear();
//       for (var i = 0; i < jsonlist.length; i++) {
//         listofdata.add(TransactionModel.fromJson(jsonlist[i]));
//       }
//       emitLoadedData();
//     }
//   }
//
//   void emitInitiateLogin() => emit(LoginInitial());
//   void emitLoggedIn() => emit(LoginSuccessful());
//   void emitLoginFailed() => emit(LoginFailed());
//
// }
