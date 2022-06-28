import 'package:flutter/material.dart';
import 'package:friends/models/question_model.dart';
import 'package:friends/screens/home_page.dart';
import 'package:friends/styles/app_colors.dart';
import 'package:friends/styles/text_styles.dart';
import 'package:friends/widgets/custom_button.dart';
import 'package:friends/widgets/primary_textfield.dart';
import 'package:friends/widgets/secondary_textfield.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class QuestionEditPage extends StatefulWidget {
  QuestionEditPage(this.questionModel, {Key? key}) : super(key: key);

  QuestionModel? questionModel;

  @override
  State<QuestionEditPage> createState() => _QuestionEditPageState();
}

class _QuestionEditPageState extends State<QuestionEditPage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _key = GlobalKey<FormState>();
    var titleController = TextEditingController(
        text:
            widget.questionModel == null ? null : widget.questionModel!.title!);
    var questionController = TextEditingController(
        text: widget.questionModel == null
            ? null
            : widget.questionModel!.question!);
    var answerOneController = TextEditingController(
      text: widget.questionModel == null
          ? null
          : widget.questionModel!.option1!.toString(),
    );
    var answerTwoController = TextEditingController(
      text: widget.questionModel == null
          ? null
          : widget.questionModel!.option2!.toString(),
    );

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          widget.questionModel == null
              ? AppLocalizations.of(context)!.add_a_new_question
              : AppLocalizations.of(context)!.update_question,
        ),
      ),
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: Get.height * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.title,
                    style: AppTextStyles.editPageLabelStyle,
                  ),
                  const SizedBox(height: 12),
                  PrimaryCustomTextField(
                    controller: titleController,
                    hintText: AppLocalizations.of(context)!.title,
                    maxLength: 25,
                  ),
                  const SizedBox(height: 40),
                  Text(
                    AppLocalizations.of(context)!.question,
                    style: AppTextStyles.editPageLabelStyle,
                  ),
                  const SizedBox(height: 12),
                  PrimaryCustomTextField(
                    controller: questionController,
                    hintText: AppLocalizations.of(context)!.question,
                    maxLength: 25,
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.option_one,
                              style: AppTextStyles.editPageLabelStyle,
                            ),
                            const SizedBox(height: 8),
                            SecondaryCustomTextField(
                              controller: answerOneController,
                              hintText:
                                  AppLocalizations.of(context)!.option_one,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.option_two,
                              style: AppTextStyles.editPageLabelStyle,
                            ),
                            const SizedBox(height: 8),
                            SecondaryCustomTextField(
                              controller: answerTwoController,
                              hintText:
                                  AppLocalizations.of(context)!.option_two,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomMaterialButton(
                        onTap: () async {
                          if (_key.currentState!.validate()) {
                            _key.currentState!.save();
                            var newTask = QuestionModel(
                              title: titleController.text,
                              question: questionController.text,
                              option1: answerOneController.text,
                              option2: answerTwoController.text,
                              createdAt: DateTime.now(),
                            );
                            if (widget.questionModel != null) {
                              widget.questionModel!.title = newTask.title;
                              widget.questionModel!.question = newTask.question;
                              widget.questionModel!.save();
                              Navigator.pop(context);
                            } else {
                              Hive.box("q").add(newTask);
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                                (route) => false,
                              );
                            }
                          }
                        },
                        text: widget.questionModel == null
                            ? AppLocalizations.of(context)!.add_a_new_question
                            : AppLocalizations.of(context)!.update_question,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
