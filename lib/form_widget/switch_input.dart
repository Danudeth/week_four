import 'package:flutter/material.dart';

class SwitchInput extends StatefulWidget {
  const SwitchInput({super.key});

  @override
  State<SwitchInput> createState() => _SwitchInputState();
}

class _SwitchInputState extends State<SwitchInput> {
  final _formKey = GlobalKey<FormState>();
  bool _isSwitched = true;
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
                    SwitchListTile(
                      title: const Text('Enable Notifications'),
                      value: _isSwitched,
                      onChanged: (value) {
                        setState(() {
                          _isSwitched = value;
                        });
                      },
                    )
            ]))
        );
  }
}
