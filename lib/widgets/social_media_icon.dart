import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIcon extends StatelessWidget {
  final String socialMedia;
  final String socialMediaLink;
  const SocialMediaIcon({
    super.key,
    required this.socialMedia,
    required this.socialMediaLink,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        //responds to the touch action as performed by the user
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/$socialMedia'),
          radius: 40,
        ),
        onTap: () {
          launchUrl(Uri.parse(socialMediaLink), mode: LaunchMode.externalApplication);
          //mode: LaunchMode.externalApplication to open it in browser
        },
      ),
    );
  }
}
