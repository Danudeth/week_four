import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  final _fromKey = GlobalKey<FormState>();
  String? _selectedItem;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Drop Down"),
            backgroundColor: Colors.orange,
          ),
          body: Form(
            key: _fromKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Select Number'),
                  value: _selectedItem,
                  items: ['one', 'two', 'three']
                      .map((item) =>
                          DropdownMenuItem(value: item, child: Text(item)))
                      .toList(),
                  onChanged: (value) {
                    _selectedItem = value;
                  },
                  validator: (value) =>
                      value == null ? 'Please select a number' : null,
                ),
                ElevatedButton(onPressed: (){
                  if(_fromKey.currentState!.validate()) {
                    print("$_selectedItem");
                  }
                }, child: Text("Save"))
              ],
            ),
          )),
    );
  }
}
