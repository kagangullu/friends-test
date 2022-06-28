import 'package:flutter/material.dart';
import 'package:friends/models/question_model.dart';
import 'package:friends/screens/quiz_page.dart';
import 'package:friends/styles/app_colors.dart';
import 'package:friends/widgets/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:lottie/lottie.dart';

class QuizTimePage extends StatefulWidget {
  const QuizTimePage({Key? key, required this.questionModel}) : super(key: key);

  final QuestionModel questionModel;

  @override
  State<QuizTimePage> createState() => _QuizTimePageState();
}

class _QuizTimePageState extends State<QuizTimePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.ready_one),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Lottie.asset(
                "assets/lottie/friend.zip",
              ),
              const SizedBox(height: 20),
              CustomMaterialButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizPage(
                        questionModel: widget.questionModel,
                      ),
                    ),
                  );
                },
                text: AppLocalizations.of(context)!.ready_two,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
