import 'package:first_app/start.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIcon extends StatelessWidget {
  String socialMedia;
  String socialMediaLink;

  SocialMediaIcon({
    Key? key,
    required this.socialMedia,
    required this.socialMediaLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        // Responds to the touch action performed by the user
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/$socialMedia'),
          radius: 40,
        ),
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.orange)),
                    onPressed: () {
                      launchUrl(Uri.parse(socialMediaLink),
                          mode: LaunchMode.externalApplication);
                    },
                    child: Text('start $socialMedia'));
              });
        },
      ),
    );
  }
}
