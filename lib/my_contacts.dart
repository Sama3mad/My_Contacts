import 'package:first_app/widgets/social_media_icon.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyContacts extends StatefulWidget {
  MyContacts({Key? key}) : super(key: key);

  @override
  State<MyContacts> createState() => _MyContactsState();
}

class _MyContactsState extends State<MyContacts> {
  //I pass the function SetState over the widgets tree
  void changeMyState(){
    setState(() {
      
    });
  }



  final Map<String, String> socialMedia = {
    'icon2.png': 'https://www.gammal.tech/',
    'icon3.png': 'https://www.instagram.com/sama_abu_zahra/',
    'icon4.png': 'https://www.facebook.com/profile.php?id=100023848220867',
  };

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
                icon: myPlatform == null
                    ? Icon(
                        Icons.phone,
                        size: 20,
                        color: Colors.white,
                      )
                    : CircleAvatar(backgroundImage: AssetImage('assets/$myPlatform'), radius: 15,),//to make it like an icon
                    //Image(image: AssetImage('assets/$myPlatform')),              
                onPressed: () {
                  myUrl == null
                      ? launchUrl(Uri.parse('tel:+201021698769'))
                      : launchUrl(myUrl!, mode: LaunchMode.externalApplication);
                },
              ),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 5, 7, 30),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
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
                  mainAxisSize: MainAxisSize.min,
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
                        launchUrl(Uri.parse('tel:+201021698769'));
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                GridView.builder(
                  itemCount: socialMedia.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    final String iconPath = socialMedia.keys.toList()[index];
                    Uri url = Uri.parse(socialMedia.values.toList()[index]);
                    return SocialMediaIcon(socialMedia: iconPath, socialMediaLink: url, changeState: changeMyState);
                  },
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
