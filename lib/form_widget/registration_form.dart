import 'package:flutter/material.dart';

class FormInput extends StatefulWidget {
  const FormInput({super.key});

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final _fromKey = GlobalKey<FormState>();
  String? _gender = 'Male';
  String? _selectedItem;
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Form'),
      ),
      body: Form(
        key: _fromKey,
          child: Container(
            margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Full Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text('Gender')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: RadioListTile(
                  title: const Text('Male'),
                  value: 'Male',
                  groupValue: _gender,
                  onChanged: (value){
                    setState(() {
                      _gender = value.toString();
                    });
                  }
                ),),
                Expanded(child: RadioListTile(
                  title: const Text('Female'),
                  value: 'Female',
                  groupValue: _gender,
                  onChanged: (value){
                    setState(() {
                      _gender = value.toString();
                    });
                  }
                ),)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Province'),
              value: _selectedItem,
              items: ['Bangkok', 'Chiang Mai', 'Phuket', 'Knon Kaen']
                  .map((item) =>
                      DropdownMenuItem(value: item, child: Text(item)))
                  .toList(),
              onChanged: (value) {
                _selectedItem = value;
              },
              validator: (value) =>
                  value == null ? 'Please select a province' : null,
            ),
            SizedBox(
              height: 10,
            ),
            CheckboxListTile(
              title: const Text('Accept Terms & Conditions'),
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_fromKey.currentState!.validate()) {
                    print('Form is valid');
                  }
                },
                child: Text("Submit"))
          ],
        ),
      )),
    );
  }
}
