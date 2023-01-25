import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:students/database/data_model.dart';

//ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

class DbFunction extends ChangeNotifier {
  List<StudentModel> studentList = [];
  Future<void> addStudent(StudentModel value) async {
    final studentdb = await Hive.openBox<StudentModel>('student_db');
    final _id = await studentdb.add(value);
    value.id = _id;
    final data = StudentModel(
        id: _id,
        name: value.name,
        place: value.place,
        batch: value.batch,
        domain: value.domain);

    await studentdb.put(_id, data);
    studentList.add(value);
    notifyListeners();
  }

  Future<void> getAllStudents() async {
    final studentdb = await Hive.openBox<StudentModel>('student_db');
    studentList.clear();
    studentList.addAll(studentdb.values);
    notifyListeners();
  }

  Future<void> deleteStudent(int id) async {
    final studentdb = await Hive.openBox<StudentModel>('student_db');
    await studentdb.deleteAt(id);
    getAllStudents();
  }

  Future<void> updateStudent(StudentModel data) async {
    final studentdb = await Hive.openBox<StudentModel>('student_db');
    //data.save();
    await studentdb.put(data.id, data);
    getAllStudents();
  }
}
