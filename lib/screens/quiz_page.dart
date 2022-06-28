// ignore_for_file: must_be_immutable

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:friends/models/question_model.dart';
import 'package:friends/models/random_question_model.dart';
import 'package:friends/screens/countdown_finish_page.dart';
import 'package:friends/screens/results_page.dart';
import 'package:friends/styles/app_colors.dart';
import 'package:friends/widgets/options_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuizPage extends StatefulWidget {
  final QuestionModel questionModel;
  int index = 0;

  QuizPage({
    Key? key,
    required this.questionModel,
  }) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    String currentOption = "";

    List<RandomQuizModel> randomList = [
      RandomQuizModel(
        question: AppLocalizations.of(context)!.a,
        option1: AppLocalizations.of(context)!.yes,
        option2: AppLocalizations.of(context)!.no,
      ),
      RandomQuizModel(
        question: AppLocalizations.of(context)!.b,
        option1: AppLocalizations.of(context)!.yes,
        option2: AppLocalizations.of(context)!.no,
      ),
      RandomQuizModel(
        question: AppLocalizations.of(context)!.c,
        option1: AppLocalizations.of(context)!.yes,
        option2: AppLocalizations.of(context)!.no,
      ),
      RandomQuizModel(
        question: AppLocalizations.of(context)!.d,
        option1: AppLocalizations.of(context)!.yes,
        option2: AppLocalizations.of(context)!.no,
      ),
      RandomQuizModel(
        question: AppLocalizations.of(context)!.e,
        option1: AppLocalizations.of(context)!.yes,
        option2: AppLocalizations.of(context)!.no,
      ),
      RandomQuizModel(
        question: AppLocalizations.of(context)!.f,
        option1: AppLocalizations.of(context)!.yes,
        option2: AppLocalizations.of(context)!.no,
      ),
      RandomQuizModel(
        question: AppLocalizations.of(context)!.g,
        option1: AppLocalizations.of(context)!.yes,
        option2: AppLocalizations.of(context)!.no,
      ),
      RandomQuizModel(
        question: AppLocalizations.of(context)!.h,
        option1: AppLocalizations.of(context)!.yes,
        option2: AppLocalizations.of(context)!.no,
      ),
      RandomQuizModel(
        question: AppLocalizations.of(context)!.i,
        option1: AppLocalizations.of(context)!.yes,
        option2: AppLocalizations.of(context)!.no,
      ),
      RandomQuizModel(
        question: AppLocalizations.of(context)!.j,
        option1: AppLocalizations.of(context)!.yes,
        option2: AppLocalizations.of(context)!.no,
      ),
      RandomQuizModel(
        question: AppLocalizations.of(context)!.k,
        option1: AppLocalizations.of(context)!.yes,
        option2: AppLocalizations.of(context)!.no,
      ),
      RandomQuizModel(
        question: AppLocalizations.of(context)!.l,
        option1: AppLocalizations.of(context)!.yes,
        option2: AppLocalizations.of(context)!.no,
      ),
      RandomQuizModel(
        question: AppLocalizations.of(context)!.m,
        option1: AppLocalizations.of(context)!.yes,
        option2: AppLocalizations.of(context)!.no,
      ),
      RandomQuizModel(
        question: AppLocalizations.of(context)!.n,
        option1: AppLocalizations.of(context)!.yes,
        option2: AppLocalizations.of(context)!.no,
      ),
      RandomQuizModel(
        question: AppLocalizations.of(context)!.o,
        option1: AppLocalizations.of(context)!.yes,
        option2: AppLocalizations.of(context)!.no,
      ),
      RandomQuizModel(
        question: AppLocalizations.of(context)!.p,
        option1: AppLocalizations.of(context)!.yes,
        option2: AppLocalizations.of(context)!.no,
      ),
      RandomQuizModel(
        question: AppLocalizations.of(context)!.r,
        option1: AppLocalizations.of(context)!.yes,
        option2: AppLocalizations.of(context)!.no,
      ),
      RandomQuizModel(
        question: AppLocalizations.of(context)!.s,
        option1: AppLocalizations.of(context)!.yes,
        option2: AppLocalizations.of(context)!.no,
      ),
      RandomQuizModel(
        question: AppLocalizations.of(context)!.t,
        option1: AppLocalizations.of(context)!.yes,
        option2: AppLocalizations.of(context)!.no,
      ),
      RandomQuizModel(
        question: AppLocalizations.of(context)!.u,
        option1: AppLocalizations.of(context)!.yes,
        option2: AppLocalizations.of(context)!.no,
      ),
      RandomQuizModel(
        question: AppLocalizations.of(context)!.v,
        option1: AppLocalizations.of(context)!.yes,
        option2: AppLocalizations.of(context)!.no,
      ),
      RandomQuizModel(
        question: AppLocalizations.of(context)!.y,
        option1: AppLocalizations.of(context)!.yes,
        option2: AppLocalizations.of(context)!.no,
      ),
      RandomQuizModel(
        question: AppLocalizations.of(context)!.z,
        option1: AppLocalizations.of(context)!.yes,
        option2: AppLocalizations.of(context)!.no,
      ),
      RandomQuizModel(
        question: AppLocalizations.of(context)!.watch_friends,
        option1: AppLocalizations.of(context)!.yes,
        option2: AppLocalizations.of(context)!.no,
      ),
    ];
    randomList.shuffle();

    CountDownController countDownController = CountDownController();

    RandomQuizModel trueQuestion = RandomQuizModel(
      question: widget.questionModel.question,
      option1: widget.questionModel.option1,
      option2: widget.questionModel.option2,
    );

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.index < 8
                  ? randomList[widget.index].question.toString()
                  : trueQuestion.question.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 50,
            ),
            CircularCountDownTimer(
              key: UniqueKey(),
              width: 200,
              height: 200,
              duration: 5,
              fillGradient: const LinearGradient(
                colors: [
                  AppColors.primaryBlueColor,
                  AppColors.primaryBlueColorLight,
                ],
              ),
              fillColor: Colors.white,
              controller: countDownController,
              ringColor: Colors.white,
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
              isReverse: true,
              onComplete: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CountDownFinishPage(),
                    ),
                    (route) => false);
              },
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OptionWidget(
                      option: widget.index < 8
                          ? randomList[widget.index].option1.toString()
                          : trueQuestion.option1.toString(),
                      index: widget.index,
                      onTap: () {
                        if (widget.index < 8) {
                          widget.index++;
                          setState(() {});
                        } else {
                          currentOption = trueQuestion.option1.toString();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ResultsPage(result: currentOption),
                            ),
                            (route) => false,
                          );
                        }
                      },
                    ),
                    OptionWidget(
                      option: widget.index < 8
                          ? randomList[widget.index].option2.toString()
                          : trueQuestion.option2.toString(),
                      index: widget.index,
                      onTap: () {
                        if (widget.index < 8) {
                          widget.index++;
                          setState(() {});
                        } else if (widget.index == 8) {
                          currentOption = trueQuestion.option2.toString();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ResultsPage(result: currentOption),
                            ),
                            (route) => false,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
