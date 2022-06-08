import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/bloc_observer.dart';
import 'package:graduation_project_app/constants.dart';
import 'package:graduation_project_app/cubit/cubit.dart';
import 'package:graduation_project_app/cubit/states.dart';
import 'package:graduation_project_app/layouts/home_layout.dart';
import 'package:graduation_project_app/layouts/login_screen.dart';
import 'package:graduation_project_app/shared/dio_helper/dio_helper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:graduation_project_app/shared/cache_helper.dart';
import 'layouts/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  DioHelper.init();
  // await cacheHelper.init();
  // Widget widget;
  // uId = cacheHelper.getData(key: 'uId');

  // if (uId != null)
  //   widget = HomeLayout();
  // else
  //   widget = SplashScreen();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //late final Widget startWidget;
  MyApp();

  Color _primaryColor = HexColor('#2E8B57');
  Color _accentColor = HexColor('#2E8B57');
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => VitanicCubit()),
        ],
        child: BlocConsumer<VitanicCubit, VitanicStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: SplashScreen(),
                theme: ThemeData(
                  primaryColor: _primaryColor,
                  accentColor: _accentColor,
                  scaffoldBackgroundColor: Colors.green.shade100,
                  primarySwatch: Colors.grey,
                ),
              );
            }));
  }
}
