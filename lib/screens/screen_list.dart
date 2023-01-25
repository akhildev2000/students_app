import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students/colors/const.dart';

import 'package:students/database/db_functions.dart';

import 'package:students/screens/screen_search.dart';

import '../functions/add_student.dart';

class ListOfStudents extends StatelessWidget {
  const ListOfStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.only(top: 25),
        decoration: const BoxDecoration(),
        child: Column(
          children: [
            const SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: () {
                      showSearch(context: context, delegate: MySearch());
                    },
                    icon: const Icon(Icons.search),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Search'),
            ),
            Expanded(
              child: Consumer<DbFunction>(builder: (context, value, _) {
                return ListView.separated(
                    itemBuilder: (ctx, index) {
                      // final data = value[index];
                      return ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage('assets/profilepicnotext.png'),
                          radius: 25,
                        ),
                        title: Text(value.studentList[index].name),
                        subtitle: Text(value.studentList[index].domain),
                        trailing: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor: bgcolor,
                                title: const Text('Are you Sure?'),
                                content: const Text(
                                    'Your are going to delete a student'),
                                actions: [
                                  Consumer<DbFunction>(
                                    builder: (context, value, child) {
                                      return TextButton(
                                        onPressed: () {
                                          // deleteStudent(index);
                                          value.deleteStudent(index);
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Yes'),
                                      );
                                    },
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('No')),
                                ],
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.delete_rounded,
                            color: Colors.red,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx) {
                              return AddStudent(
                                data: value.studentList[index],
                              );
                            }),
                          );
                        },
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return const Divider();
                    },
                    itemCount: value.studentList.length);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
