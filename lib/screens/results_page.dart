import 'package:flutter/material.dart';
import 'package:friends/screens/home_page.dart';
import 'package:friends/widgets/custom_button.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key, required this.result}) : super(key: key);

  final String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(AppLocalizations.of(context)!.results),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Lottie.asset("assets/lottie/confetti.zip",
                  height: 300, width: 300),
              Text(
                AppLocalizations.of(context)!.answered,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              Text(
                result,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              CustomMaterialButton(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                    (route) => false,
                  );
                },
                text: AppLocalizations.of(context)!.to_home,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
