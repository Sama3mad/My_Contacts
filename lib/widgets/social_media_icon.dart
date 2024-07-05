import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIcon extends StatefulWidget {
  String socialMedia;
  Uri socialMediaLink;
  Function changeState;
  //I send the function itself
  SocialMediaIcon({
    super.key,
    required this.socialMedia,
    required this.socialMediaLink,
    required this.changeState,
  });

  @override
  State<SocialMediaIcon> createState() => _SocialMediaIconState();
}

class _SocialMediaIconState extends State<SocialMediaIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        //responds to the touch action as performed by the user
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/${widget.socialMedia}'),
          radius: 40,
        ),
        onDoubleTap: (){
          widget.changeState();
          //widget: to access the parameters in the stateful widget class
          myPlatform = widget.socialMedia;
          myUrl = widget.socialMediaLink;
        },
        onTap: () {
          launchUrl(widget.socialMediaLink, mode: LaunchMode.externalApplication);
          //mode: LaunchMode.externalApplication to open it in browser
        },
      ),
    );
  }
}

  //global variables 
  //can be access because the my_contacts can access this page 
  String? myPlatform;
  Uri? myUrl;