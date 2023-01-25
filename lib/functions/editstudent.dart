import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:provider/provider.dart';

import 'package:students/colors/const.dart';
import 'package:students/database/data_model.dart';
import 'package:students/database/db_functions.dart';

// TextEditingController _nameController = TextEditingController();
// TextEditingController _placeController = TextEditingController();
// TextEditingController _batchContoller = TextEditingController();
// TextEditingController _domainContoller = TextEditingController();
final _formKey = GlobalKey<FormState>();
final updateNameController = TextEditingController();
final updatePlaceController = TextEditingController();
final updateBatchController = TextEditingController();
final updateDomianController = TextEditingController();

// ignore: must_be_immutable
class EditsStudents extends StatelessWidget {
  EditsStudents({super.key, required this.data});
  StudentModel data;
  @override
  Widget build(BuildContext context) {
    updateNameController.text = data.name;
    updatePlaceController.text = data.place;
    updateBatchController.text = data.batch;
    updateDomianController.text = data.domain;
    return Consumer<DbFunction>(builder: (context, value, _) {
      return Scaffold(
        backgroundColor: bgcolor,
        body: Form(
          key: _formKey,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Name is required';
                    } else if (value.contains('@') || value.contains('.')) {
                      return 'Enter valied Name';
                    } else {
                      return null;
                    }
                  },
                  controller: updateNameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Place',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Place is required';
                    } else if (value.contains('@') || value.contains('.')) {
                      return 'Enter valied Place';
                    } else {
                      return null;
                    }
                  },
                  controller: updatePlaceController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Batch',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Batch is required';
                    } else if (value.contains('@') || value.contains('.')) {
                      return 'Enter valied Batch Number';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  controller: updateBatchController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Domian',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Domian is required';
                    } else if (value.contains('@') || value.contains('.')) {
                      return 'Enter valied Domain';
                    } else {
                      return null;
                    }
                  },
                  controller: updateDomianController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                ElevatedButton(
                  onPressed: () {
                    // final id = data.id;
                    final name = updateNameController.text;
                    final place = updatePlaceController.text;
                    final batch = updateBatchController.text;
                    final domain = updateDomianController.text;
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Data Added!!')),
                      );
                      final student = StudentModel(
                          id: data.id,
                          name: name,
                          place: place,
                          batch: batch,
                          domain: domain);
                      value.updateStudent(student);

                      Navigator.pop(context);
                      Navigator.pop(context);
                      //data.save();
                      //getAllStudents();
                    }
                  },
                  child: Text('Edit Data'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: bgcolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      );
    });
  }
}
