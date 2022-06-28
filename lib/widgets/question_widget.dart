import 'package:flutter/material.dart';
import 'package:friends/models/question_model.dart';
import 'package:friends/screens/question_edit_page.dart';
import 'package:friends/screens/quiz_time_page.dart';
import 'package:friends/styles/text_styles.dart';
import 'package:hive/hive.dart';

class CustomQuestionWidget extends StatefulWidget {
  const CustomQuestionWidget({
    Key? key,
    required this.index,
    required this.questionModel,
  }) : super(key: key);

  final QuestionModel questionModel;
  final int index;
  @override
  State<CustomQuestionWidget> createState() => _CustomQuestionWidgetState();
}

class _CustomQuestionWidgetState extends State<CustomQuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuizTimePage(
                questionModel: widget.questionModel,
              ),
            ),
          );
        },
        child: Container(
          width: 200,
          height: 125,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      widget.questionModel.title!,
                      style: AppTextStyles.editPageLabelStyle,
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.green,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuestionEditPage(
                              widget.questionModel,
                            ),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        Hive.box("q").deleteAt(widget.index);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      widget.questionModel.question!,
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
