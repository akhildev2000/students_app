import 'package:flutter/material.dart';
import 'package:students/colors/const.dart';
import 'package:students/database/data_model.dart';
import 'package:students/database/db_functions.dart';
//import 'package:students/db_functions.dart';
import 'package:students/functions/editstudent.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({super.key, required this.data});
  final StudentModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                child: Text(
                  '${data.name} Details',
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                child: Container(
                  height: 500,
                  width: 300,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: textFieldcolor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage('assets/profilepicnotext.png'),
                        radius: 50,
                      ),
                      Text('Name:-${data.name}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(height: 10),
                      Text('Place:- ${data.place}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(height: 10),
                      Text('Batch:- ${data.batch}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(height: 10),
                      Text('Domain:- ${data.domain}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              overflow: TextOverflow.ellipsis)),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black38,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (ctx) {
                            return EditsStudents(data: data);
                          }));
                        },
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit '),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
