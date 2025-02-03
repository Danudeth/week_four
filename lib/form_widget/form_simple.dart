import 'package:flutter/material.dart';

class FormSimple extends StatefulWidget {
  const FormSimple({super.key});

  @override
  State<FormSimple> createState() => _FormSimpleState();
}

class _FormSimpleState extends State<FormSimple> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.add),
            title: Text(
              "Form Simple",
            ),
            backgroundColor: Colors.orange,
          ),
          body: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _username,
                  decoration: const InputDecoration(labelText: 'Username'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _password,
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if(value.length < 8){
                      return 'more than 8';
                    }
                    return null;
                  },
                ),
                ElevatedButton(onPressed: (){
                  // if(_formKey.currentState!.validate()) {
                  //   print("Form is valid"); 
                  // }
                  print("Username: ${_username.text}");
                  print("Password: ${_password.text}");
                }, 
                child: const Text("Save"))
              ],
            ),
          )),
    );
  }
}
