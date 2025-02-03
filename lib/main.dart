import 'package:flutter/material.dart';
import 'package:week_four/Homework/air_quality_api.dart';
import 'package:week_four/api_test/simple_api_call.dart';
import 'package:week_four/form_widget/checkbox.dart';
import 'package:week_four/form_widget/dropdown.dart';
import 'package:week_four/form_widget/registration_form.dart';
import 'package:week_four/form_widget/form_simple.dart';
import 'package:week_four/form_widget/radio_input.dart';
import 'package:week_four/form_widget/switch_input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AirQualityApi());
  }
}
