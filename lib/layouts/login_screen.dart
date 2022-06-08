import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project_app/constants.dart';
import 'package:graduation_project_app/cubit/cubit.dart';
import 'package:graduation_project_app/cubit/states.dart';
import 'package:graduation_project_app/layouts/home_layout.dart';
import 'package:graduation_project_app/shared/components.dart';
import 'package:graduation_project_app/shared/dio_helper/dio_helper.dart';
import 'package:graduation_project_app/widgets/header_widget.dart';
import 'package:graduation_project_app/shared/cache_helper.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VitanicCubit, VitanicStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var datais;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: HexColor('#2E8B57'),
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    child: HeaderWidget(100, false, Icons.house_rounded),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Welcome to vitanic app :)',
                          style: TextStyle(color: Colors.grey, fontSize: 20.0),
                        ),
                        SizedBox(height: 40.0),
                        defaultFormFeild(
                          controller:
                              VitanicCubit.geta(context).emailController,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty)
                              return 'email must not be empty';
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormFeild(
                          controller:
                              VitanicCubit.geta(context).passwordController,
                          type: TextInputType.text,
                          validate: (value) {
                            if (value!.isEmpty)
                              return 'password must not be empty';
                          },
                          label: 'password',
                          ispassword: true,
                          prefix: Icons.lock_outline_rounded,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Material(
                          elevation: 20.0,
                          shadowColor: HexColor('#2E8B57'),
                          borderRadius: BorderRadius.circular(50.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: HexColor('#2E8B57')),
                            child: MaterialButton(
                              onPressed: () {
                                print(
                                    VitanicCubit.geta(context).getSensorData());
                                if (formKey.currentState!.validate()) {
                                  VitanicCubit.geta(context)
                                      .getUserData()
                                      .then((value) {
                                    VitanicCubit.geta(context).data['isuser'] =
                                        value;
                                    if (VitanicCubit.geta(context)
                                            .data['isuser'] ==
                                        "WRONG_USER") {
                                      showToast(
                                          msg: 'user not found',
                                          state: ToastStates.ERROR,
                                          gravity: ToastGravity.TOP);
                                    } else if (VitanicCubit.geta(context)
                                            .data['isuser'] ==
                                        "WRONG_PASSWORD") {
                                      showToast(
                                          msg: 'wrong password',
                                          state: ToastStates.ERROR,
                                          gravity: ToastGravity.TOP);
                                    } else if (VitanicCubit.geta(context)
                                            .data['isuser'] ==
                                        "ok") {
                                      VitanicCubit.geta(context).userLogin(
                                          email: VitanicCubit.geta(context)
                                              .emailController
                                              .text,
                                          password: VitanicCubit.geta(context)
                                              .passwordController
                                              .text);

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeLayout()));
                                    }
                                  });
                                  print(VitanicCubit.geta(context)
                                      .getSensorData());
                                }
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
