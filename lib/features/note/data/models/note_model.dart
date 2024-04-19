import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subTitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  String category;
  @HiveField(4)
  String categoryIcon;
  @HiveField(5)
  int color;
  @HiveField(6)
  int priority;
  @HiveField(7)
  bool completed;

  NoteModel({
    required this.title,
    required this.subTitle,
    required this.date,
    required this.category,
    required this.categoryIcon,
    required this.color,
    required this.priority,
    required this.completed,
  });
}
