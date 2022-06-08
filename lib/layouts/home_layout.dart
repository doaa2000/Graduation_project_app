import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/constants.dart';
import 'package:graduation_project_app/cubit/cubit.dart';
import 'package:graduation_project_app/cubit/states.dart';
import 'package:graduation_project_app/shared/dio_helper/dio_helper.dart';
import 'package:graduation_project_app/widgets/header_widget.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:http/http.dart' as http;
import 'package:graduation_project_app/event_bus.dart' as event_bus;

class HomeLayout extends StatefulWidget {
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var h = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VitanicCubit, VitanicStates>(
      listener: (context, state) => {},
      builder: (context, state) {
        var datais;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            title: Text('SENSORS DATA',
                style: TextStyle(fontSize: 25.0, color: HexColor('#6DA100'))),
            titleSpacing: 0.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: RefreshIndicator(
              onRefresh: () async {
                await VitanicCubit.geta(context).getSensorData().then((value) {
                  setState(() {
                    print("refreshed");
                  });
                });
              },
              child: ListView(
                //physics: BouncingScrollPhysics(),
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: SleekCircularSlider(
                                  appearance: CircularSliderAppearance(
                                      customWidths: CustomSliderWidths(
                                          trackWidth: 4,
                                          progressBarWidth: 20,
                                          shadowWidth: 40),
                                      customColors: CustomSliderColors(
                                          trackColor: HexColor('#ef6c00'),
                                          progressBarColor: HexColor('#ffb74d'),
                                          shadowColor: HexColor('#ffb74d'),
                                          shadowMaxOpacity: 0.5, //);
                                          shadowStep: 20),
                                      infoProperties: InfoProperties(
                                          bottomLabelStyle: TextStyle(
                                              color: HexColor('#6DA100'),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                          bottomLabelText: 'Temperature',
                                          mainLabelStyle: TextStyle(
                                              color: HexColor('#54826D'),
                                              fontSize: 30.0,
                                              fontWeight: FontWeight.w600),
                                          modifier: (double valuew) {
                                            return '30 %';
                                          }),
                                      startAngle: 90,
                                      angleRange: 360,
                                      size: 200.0,
                                      animationEnabled: true),
                                  min: 0,
                                  max: 100,
                                  initialValue: 50,
                                ),
                              ),
                              // Material(
                              //   borderRadius: BorderRadius.circular(10.0),
                              //   elevation: 20.0,
                              //   child: TextFormField(
                              //     decoration: InputDecoration(
                              //       border: InputBorder.none,
                              //       hintText: 'Temprature',
                              //       hintStyle: TextStyle(color: Colors.grey),
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Center(
                                child: SleekCircularSlider(
                                  appearance: CircularSliderAppearance(
                                      customWidths: CustomSliderWidths(
                                          trackWidth: 4,
                                          progressBarWidth: 20,
                                          shadowWidth: 40),
                                      customColors: CustomSliderColors(
                                          trackColor: HexColor('#b06500'),
                                          progressBarColor: HexColor('#87CEFA'),
                                          shadowColor: HexColor('#87CEFA'),
                                          shadowMaxOpacity: 0.5, //);
                                          shadowStep: 20),
                                      infoProperties: InfoProperties(
                                          bottomLabelStyle: TextStyle(
                                              color: HexColor('#00BFFF'),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                          bottomLabelText: 'Humidity rate',
                                          mainLabelStyle: TextStyle(
                                              color: HexColor('#54826D'),
                                              fontSize: 30.0,
                                              fontWeight: FontWeight.w600),
                                          modifier: (double valuew) {
                                            VitanicCubit.geta(context)
                                                .getSensorData()
                                                .then((value) {
                                              VitanicCubit.geta(context)
                                                  .data['data'] = value;
                                            });
                                            return '${VitanicCubit.geta(context).data['data']}˚C';
                                          }),
                                      startAngle: 90,
                                      angleRange: 360,
                                      size: 200.0,
                                      animationEnabled: true),
                                  min: 0,
                                  max: 100,
                                  initialValue: 30,
                                ),
                              ),

                              // Material(
                              //   borderRadius: BorderRadius.circular(10.0),
                              //   elevation: 20.0,
                              //   child: TextFormField(
                              //     controller: h,
                              //     decoration: InputDecoration(
                              //       border: InputBorder.none,
                              //       hintText: 'hello',
                              //       hintStyle: TextStyle(color: Colors.grey),
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(height: 40.0),
                              // Row(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Text(
                              //       'Irrigation valves',
                              //       style: TextStyle(fontSize: 20.0),
                              //     ),
                              //     Spacer(),
                              //     CupertinoSwitch(
                              //       value: true,
                              //       onChanged: (value) {},
                              //       activeColor: HexColor('#2E8B57'),
                              //       trackColor: Colors.grey,
                              //     ),
                              //   ],
                              // ),
                              // Row(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Text(
                              //       'Fans',
                              //       style: TextStyle(fontSize: 20.0),
                              //     ),
                              //     Spacer(),
                              //     CupertinoSwitch(
                              //       value: true,
                              //       onChanged: (value) {},
                              //       activeColor: HexColor('#2E8B57'),
                              //       trackColor: Colors.grey,
                              //     ),
                              //   ],
                              // ),
                              // Row(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Text(
                              //       'Gate',
                              //       style: TextStyle(fontSize: 20.0),
                              //     ),
                              //     Spacer(),
                              //     CupertinoSwitch(
                              //       value: true,
                              //       onChanged: (value) {},
                              //       activeColor: HexColor('#2E8B57'),
                              //       trackColor: Colors.grey,
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              color: Colors.lightGreen,
              //  backgroundColor: Colors.lightGreen,
              strokeWidth: 4),
        );
      },
    );
  }
}
