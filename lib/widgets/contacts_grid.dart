
import 'package:first_app/widgets/social_media_icon.dart';
import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({
    super.key,
    required this.socialMedia,
  });

  final Map<String, String> socialMedia;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: socialMedia.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3),
      itemBuilder: (context, index) {
        return SocialMediaIcon(
            socialMedia: socialMedia.keys.toList()[index],
            socialMediaLink: socialMedia.values.toList()[index]);
        //index from 0 to itemCount
      },
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(8),
    );
  }
}