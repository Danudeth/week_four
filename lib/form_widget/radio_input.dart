import 'package:flutter/material.dart';

class RadioInput extends StatefulWidget {
  const RadioInput({super.key});

  @override
  State<RadioInput> createState() => _RadioInputState();
}

class _RadioInputState extends State<RadioInput> {
  final _formKey = GlobalKey<FormState>();
  String? _gender = 'Female';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Simple Form'),
        ),
        body: Form(
            key: _formKey,
            child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [
                    Column(children: [
                      RadioListTile(
                        title: const Text('Male'),
                        value: 'Male',
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: const Text('Female'),
                        value: 'Female',
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value.toString();
                          });
                        },
                      ),
                    ]),
            ])));
    ;
  }
}
