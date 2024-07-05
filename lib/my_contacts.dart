import 'package:first_app/widgets/social_media_icon.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyContacts extends StatefulWidget {
  MyContacts({Key? key}) : super(key: key);

  @override
  State<MyContacts> createState() => _MyContactsState();
}

class _MyContactsState extends State<MyContacts> {
  //List<String> social_media_icon = ['icon2.png', 'icon3.png', 'icon4.png'];
  Map<String, String> socialMedia = {
    'icon2.png': 'https://www.gammal.tech/',
    'icon3.png': 'https://www.instagram.com/sama_abu_zahra/',
    'icon4.png': 'https://www.facebook.com/profile.php?id=100023848220867',
  };

  //we used that to solve the problem of making the social media icons static
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 5, 7, 30),
          title:
              Text('My Contact Screen', style: TextStyle(color: Colors.white)),
          leading: GestureDetector(
            child: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onTap: () {
              print('icon is pressed');
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: Icon(
                  Icons.phone,
                  size: 20,
                  color: Colors.white,
                ),
                onPressed: () {
                  print('Icon is pressed');
                  //launch('tel:+123456789');
                  //'launch' is deprecated and shouldn't be used
                  //so there is another new version of this function that is better to use
                  launchUrl(Uri.parse('tel:+201021698769'));
                },
              ),
            ),
          ],
        ),
        // appBar: AppBar(
        //   backgroundColor: Color.fromARGB(255, 5, 7, 30),
        //   title:
        //       Text('My Contact Screen', style: TextStyle(color: Colors.white)),
        //   leading: GestureDetector(
        //     child: Icon(
        //       Icons.home,
        //       color: Colors.white,
        //     ),
        //     onTap: () {
        //       print('icon is pressed');
        //     },
        //   ),
        //   actions: [
        //     Padding(
        //       padding: const EdgeInsets.only(right: 8.0),
        //       child: IconButton(onPressed: (){} , icon: Icon(Icons.search), color: Colors.white,),
        //       //Icon(Icons.home, color: Colors.white,),
        //     ),
        //   ],
        //   //this is similar to the inkWell widget. They both make it clickable
        // ),
        backgroundColor: Color.fromARGB(255, 5, 7, 30),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            //to make the whole page scrollable
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //everything inside it is at the center
              children: [
                SizedBox(
                  height: 50,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/Sama.JPG'),
                  radius: 100,
                ),
                SizedBox(height: 20),
                Text('Sama Abu Zahra',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //to make the items at the center of the screen (main in row: horizontal & cross: vertical)
                  mainAxisSize: MainAxisSize.min,
                  //similar to the size of the elements inside a row
                  children: [
                    Text('+20123456789',
                        style: TextStyle(fontSize: 25, color: Colors.grey)),
                    SizedBox(height: 20),
                    IconButton(
                      icon: Icon(
                        Icons.phone,
                        size: 20,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        print('Icon is pressed');
                        //launch('tel:+123456789');
                        //'launch' is deprecated and shouldn't be used
                        //so there is another new version of this function that is better to use
                        launchUrl(Uri.parse('tel:+201021698769'));
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                //we no longer need expanded because we can scroll to the last element
                GridView.builder(
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
                )

                // Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                //   SocialMediaIcon(socialMedia: 'icon'),
                //   SocialMediaIcon(socialMedia: 'icon'),
                //   SocialMediaIcon(socialMedia: 'icon'),

                // ]),
                // SizedBox(height: 30),
                // Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                //   SocialMediaIcon(socialMedia: 'icon'),
                //   SocialMediaIcon(socialMedia: 'icon'),
                //   SocialMediaIcon(socialMedia: 'icon'),
                // ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
