import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StartSocialMedia extends StatelessWidget {
  Uri url;
  StartSocialMedia({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 7, 30),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.orange)),
            onPressed: () {
              launchUrl(url,
                  mode: LaunchMode.externalApplication);
            },
            child: Text('start social media')),
      ),
    );
  }
}
