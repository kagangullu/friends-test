import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:friends/models/question_model.dart';
import 'package:friends/screens/popup_screens/about_page.dart';
import 'package:friends/screens/popup_screens/contact_page.dart';
import 'package:friends/screens/popup_screens/version_page.dart';
import 'package:friends/screens/question_edit_page.dart';
import 'package:friends/styles/app_colors.dart';
import 'package:friends/widgets/question_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    void onSelected(BuildContext context, int item) {
      switch (item) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AboutPage(),
            ),
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const VersionPage(),
            ),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ContactPage(),
            ),
          );
          break;
      }
    }

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(AppLocalizations.of(context)!.your_questions),
        actions: [
          PopupMenuButton<int>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(AppLocalizations.of(context)!.about),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: [
                    Icon(
                      Icons.update,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(AppLocalizations.of(context)!.version),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 2,
                child: Row(
                  children: [
                    Icon(
                      Icons.mail_outline,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(AppLocalizations.of(context)!.contact),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box("q").listenable(),
        builder: (context, box, _) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  formatDate(DateTime.now(), [d, ", ", M, " ", yyyy]),
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: Hive.box("q").isEmpty ? 1 : Hive.box("q").length,
                    itemBuilder: (context, index) {
                      if (Hive.box("q").isEmpty) {
                        return Center(
                          child: Column(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.no_question,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          QuestionEditPage(null),
                                    ),
                                  );
                                },
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .start_add_question,
                                  textScaleFactor: 1.4,
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        QuestionModel currentTask = Hive.box("q").getAt(index);
                        return CustomQuestionWidget(
                          questionModel: currentTask,
                          index: index,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuestionEditPage(null),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
