import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Contact With Me"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: const [
                  Icon(FontAwesomeIcons.envelope, size: 20),
                  SizedBox(width: 10),
                  Text("hazret.business@gmail.com"),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  FaIcon(FontAwesomeIcons.discord),
                  SizedBox(width: 10),
                  Text("Hazret#4134"),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  FaIcon(FontAwesomeIcons.twitter),
                  SizedBox(width: 10),
                  Text("@depancon"),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  FaIcon(FontAwesomeIcons.github),
                  SizedBox(width: 10),
                  Text("Hazert-Depancon"),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  FaIcon(FontAwesomeIcons.instagram),
                  SizedBox(width: 10),
                  Text("hazreti_gudu"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
