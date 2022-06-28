import 'package:hive/hive.dart';

part 'question_model.g.dart';

@HiveType(typeId: 0)
class QuestionModel extends HiveObject {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? question;

  @HiveField(2)
  String? option1;

  @HiveField(3)
  String? option2;

  @HiveField(4)
  DateTime? createdAt;

  QuestionModel({
    required this.title,
    required this.option1,
    required this.option2,
    required this.question,
    required this.createdAt,
  });
}
