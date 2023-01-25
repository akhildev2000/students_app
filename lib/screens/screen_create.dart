import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:students/colors/const.dart';
import 'package:students/database/data_model.dart';
import 'package:students/database/db_functions.dart';
import 'package:students/screens/screen_list.dart';

class CreateStudent extends StatelessWidget {
  CreateStudent({super.key});
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _placeController = TextEditingController();
  final _batchController = TextEditingController();
  final _domainController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Provider.of<DbFunction>(context, listen: false).getAllStudents();
    return Scaffold(
      backgroundColor: bgcolor,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 55),
              child: Column(
                children: const [
                  Text(
                    'Hey There,',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Create an Student',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.only(top: 35),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: textFieldcolor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          hintText: 'Name',
                          hintStyle: const TextStyle(
                            color: placeHolderColo,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name is required';
                          } else if (value.contains('@') ||
                              value.contains('.')) {
                            return 'Enter valied Name';
                          } else {
                            return null;
                          }
                        },
                        //autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _placeController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: textFieldcolor,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25)),
                            hintText: 'Place',
                            hintStyle: const TextStyle(color: placeHolderColo)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Place is required';
                          } else if (value.contains('@') ||
                              value.contains('.')) {
                            return 'Enter valied Place';
                          } else {
                            return null;
                          }
                        },
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _batchController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: textFieldcolor,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25)),
                            hintText: 'Batch',
                            hintStyle: const TextStyle(
                              color: placeHolderColo,
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Batch is required';
                          } else if (value.contains('@') ||
                              value.contains('.')) {
                            return 'Enter valied Batch Number';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _domainController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: textFieldcolor,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                          hintText: 'Domain',
                          hintStyle: const TextStyle(color: placeHolderColo),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Domian is required';
                          } else if (value.contains('@') ||
                              value.contains('.')) {
                            return 'Enter valied Domain';
                          } else {
                            return null;
                          }
                        },
                        //  autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 300,
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Student Added!!',
                                  ),
                                ),
                              );
                              onAddStudentClicked(context);
                            }
                          },
                          icon: const Icon(Icons.add_box),
                          label: const Text(
                            'Add Student',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: textFieldcolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onAddStudentClicked(context) async {
    final _name = _nameController.text.trim();
    final _place = _placeController.text.trim();
    final _batch = _batchController.text.trim();
    final _domain = _domainController.text.trim();
    if (_name.isEmpty || _place.isEmpty || _batch.isEmpty || _domain.isEmpty) {
      return;
    }
    final _student = StudentModel(
        name: _name, place: _place, batch: _batch, domain: _domain);
    Provider.of<DbFunction>(context, listen: false).addStudent(_student);
    _nameController.clear();
    _batchController.clear();
    _domainController.clear();
    _placeController.clear();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ListOfStudents(),
      ),
    );
    //SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}
