import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/contacts_grid.dart';

class MyContacts extends StatelessWidget {
  MyContacts({Key? key}) : super(key: key);
  //List<String> social_media_icon = ['icon2.png', 'icon3.png', 'icon4.png'];
  //List<String> social_media_link = ['https://www.gammal.tech/', 'https://www.instagram.com/sama_abu_zahra/', 'https://www.facebook.com/profile.php?id=100023848220867'];
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
                GridWidget(socialMedia: socialMedia)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
