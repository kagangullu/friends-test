import 'package:flutter/material.dart';
import 'package:friends/screens/home_page.dart';
import 'package:friends/styles/app_colors.dart';
import 'package:friends/widgets/custom_button.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CountDownFinishPage extends StatelessWidget {
  const CountDownFinishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 70),
              Lottie.asset("assets/lottie/time_error.zip"),
              Text(
                AppLocalizations.of(context)!.time_is_up,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50),
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
