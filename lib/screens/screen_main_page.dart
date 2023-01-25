import 'package:flutter/material.dart';
import 'package:students/screens/screen_create.dart';
import 'package:students/screens/screen_list.dart';
import 'package:students/widgets/bottom_nav.dart';

class ScreenMainPAge extends StatelessWidget {
  ScreenMainPAge({super.key});
  final pages = [
    CreateStudent(),
    const ListOfStudents(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, _) {
          return pages[index];
        },
      ),
      bottomNavigationBar: const BottomNavWidget(),
    );
  }
}
