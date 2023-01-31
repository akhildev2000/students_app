import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students/functions/add_student.dart';
import 'package:students/database/db_functions.dart';

class MySearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listItems = query.isEmpty
        ? Provider.of<DbFunction>(context).studentList
        : Provider.of<DbFunction>(context)
            .studentList
            .where((element) => element.name
                .toUpperCase()
                .startsWith(query.toLowerCase().toString().trim()))
            .toList();

    return listItems.isEmpty
        ? const Center(child: Text("Student not exist!"))
        : ListView.builder(
            itemCount: listItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15.00, right: 15.00),
                child: Column(
                  children: [
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/profilepicnotext.png'),
                      ),
                      title: Text(listItems[index].name),
                      // subtitle:
                      //     Text("Age : ${(listItems[index].age.toString())}"),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) =>
                                AddStudent(data: listItems[index])));
                      },
                    ),
                    const Divider(
                      thickness: 3,
                      color: Colors.grey,
                    ),
                  ],
                ),
              );
            },
          );
  }
}
