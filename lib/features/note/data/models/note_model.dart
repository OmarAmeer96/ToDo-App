import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subTitle;
  @HiveField(2)
  final String startDate;
  @HiveField(3)
  final String endDate;
  @HiveField(4)
  String category;
  @HiveField(5)
  String categoryIcon;
  @HiveField(6)
  int color;
  @HiveField(7)
  int priority;

  NoteModel({
    required this.title,
    required this.subTitle,
    required this.startDate,
    required this.endDate,
    required this.category,
    required this.categoryIcon,
    required this.color,
    required this.priority,
  });
}
