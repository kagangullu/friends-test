import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonThanksWidget extends StatelessWidget {
  const PersonThanksWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.link,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String image;
  final String link;

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70),
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            onPressed: () {
              _launchInBrowser(Uri.parse(link));
            },
            child: Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
