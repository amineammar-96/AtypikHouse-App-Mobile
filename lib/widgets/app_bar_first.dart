import 'package:flutter/material.dart';
import 'package:login_api/screens/client/annonces/Annonces.dart';
import '../services/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarFirst extends StatelessWidget implements PreferredSizeWidget {
  const AppBarFirst({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text('AtypikHouse'),
        elevation: 5,
        automaticallyImplyLeading: false,
        backgroundColor: Constants.themeColorSecondary,
        actions: [
          IconButton(onPressed: (){

            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Annonces() ,

            ));

          }, icon: Icon(FontAwesomeIcons.house))
        ],
    );

  }



  @override
  Size get preferredSize => const Size.fromHeight(50);
}
