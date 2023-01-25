import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class StudentModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final name;
  @HiveField(2)
  final place;
  @HiveField(3)
  final batch;
  @HiveField(4)
  final domain;
  StudentModel(
      {required this.name,
      required this.place,
      required this.batch,
      required this.domain,
      this.id});
}
