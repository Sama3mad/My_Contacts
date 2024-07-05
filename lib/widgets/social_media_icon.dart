import 'package:first_app/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIcon extends StatefulWidget {
  String socialMedia;
  Uri socialMediaLink;
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
          //responds to the touch action as performed by the user
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/${widget.socialMedia}'),
            radius: 40,
          ),
          onDoubleTap: (){
            //value is of type MyProvider so it is what I will use to access the variables in the provider
            value.myPlatform = widget.socialMedia;
            value.myUrl = widget.socialMediaLink;
            value.notifyListeners();
            //all the consumers of this provider will act in accordance to the change
          },
          onTap: () {
            launchUrl(widget.socialMediaLink, mode: LaunchMode.externalApplication);
            //mode: LaunchMode.externalApplication to open it in browser
          },
        ),
      ),
    );
  }
}