import 'package:first_app/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIcon extends StatefulWidget {
  final String socialMedia;
  final Uri socialMediaLink;

  SocialMediaIcon({
    super.key,
    required this.socialMedia,
    required this.socialMediaLink,
  });

  @override
  State<SocialMediaIcon> createState() => _SocialMediaIconState();
}

class _SocialMediaIconState extends State<SocialMediaIcon> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/${widget.socialMedia}'),
            radius: 40,
          ),
          onDoubleTap: () {
            print("Double tapped!"); // Debugging line
            value.setMyPlatform(widget.socialMedia);
            value.setMyUrl(widget.socialMediaLink);
          },
          onTap: () {
            launchUrl(widget.socialMediaLink, mode: LaunchMode.externalApplication);
          },
        ),
      ),
    );
  }
}
