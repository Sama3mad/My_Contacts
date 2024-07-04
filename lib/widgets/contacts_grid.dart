import 'package:first_app/widgets/social_media_icon.dart';
import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  final Map<String, String> socialMedia;

  GridWidget({
    Key? key,
    required this.socialMedia,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: socialMedia.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        return SocialMediaIcon(
          socialMedia: socialMedia.keys.toList()[index],
          socialMediaLink: socialMedia.values.toList()[index],
        );
      },
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(8),
    );
  }
}
