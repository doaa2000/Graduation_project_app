import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/cubit/states.dart';
import 'package:graduation_project_app/shared/dio_helper/dio_helper.dart';
import 'package:http/http.dart' as http;

class VitanicCubit extends Cubit<VitanicStates> {
  VitanicCubit() : super(VitanicInitialStates());

  static VitanicCubit geta(context) => BlocProvider.of(context);
  // Uri host = Uri.parse("http://0.0.0.0:8000/database/get_h_value/");

  // read() {
  //   var response = http.get(host).then((value) {
  //     print(value.body);
  //   });
  // }
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  void ChangeVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(VitanicAppChangePasswordVisibility());
  }

  int? x;
  void getx() {
    x = 20;
  }

  String ur = "http://vitanic.pythonanywhere.com";
  //String ur = "http://192.168.43.121:8000";
  Future<String> getSensorData() async {
    var url = Uri.parse(
        '$ur/database/get_h_value/${emailController.text}/${passwordController.text}/');
    final response = await http.get(url);

    return response.body;
  }

  Future<String> getUserData() async {
    var url = Uri.parse(
        '$ur/database/login/${emailController.text}/${passwordController.text}/');
    final response = await http.get(url);

    return response.body;
  }

  // String? datais;
  dynamic sensorData;
  void getDData() {
    DioHelper.getData(
      url:
          'database/get_h_value/${emailController.text}/${passwordController.text}/',
    ).then((value) {
      sensorData = value.data.toString();
      print(sensorData);
      //  if(data!='WRONG_USER'&& data!='WRONG_PASSWORD')
      //  {
      //    //database
      //  }
      emit(VitanicGetDataSucessesStates());
    }).catchError((error) {
      emit(VitanicGetDataErrorStates());
    });
  }

  Map<String, dynamic> data = {
    'data': '',
    'isuser': '',
  };
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(SocialloadingStates());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);

      emit(SocialLoginSuccessStates(value.user!.uid));
    }).catchError((error) {
      emit(SocialLoginErrorStates(error.toString()));
    });
  }
}
