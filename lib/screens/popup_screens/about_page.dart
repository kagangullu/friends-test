import 'package:flutter/material.dart';
import 'package:friends/widgets/thanks_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("About Page and Thanks"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  AppLocalizations.of(context)!.about_string_one,
                  textScaleFactor: 1.2,
                ),
                const SizedBox(height: 10),
                Text(
                  AppLocalizations.of(context)!.about_string_two,
                  textScaleFactor: 1.2,
                ),
                const SizedBox(height: 10),
                Text(
                  AppLocalizations.of(context)!.about_string_three,
                  textScaleFactor: 1.2,
                ),
                const SizedBox(height: 50),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      PersonThanksWidget(
                        title: "Ergin Güllü",
                        subtitle: "@erdinc_gullu",
                        image: "assets/images/erdinc.jpg",
                        link: "https://instagram.com/erdinc_gullu",
                      ),
                      SizedBox(width: 10),
                      PersonThanksWidget(
                        title: "Said Korkmaz",
                        subtitle: "@Said Korkmaz",
                        image: "assets/images/said.jpg",
                        link:
                            "https://www.linkedin.com/in/said-korkmaz-a52871146/",
                      ),
                      SizedBox(width: 10),
                      PersonThanksWidget(
                        title: "Veli Bacık",
                        subtitle: "@10VBacik",
                        image: "assets/images/veli.jpg",
                        link: "https://twitter.com/10VBacik",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
