import 'package:flutter/material.dart';
import 'package:login_api/screens/login_page.dart';
import 'package:provider/provider.dart';

import '../../../providers/userProvider.dart';
import '../../../services/constants.dart';

class ImageAnnonceScreen extends StatelessWidget {
  final id;
  const ImageAnnonceScreen({Key? key , required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userProviderData = context.watch<UserProvider>().user;

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(

            actions: [
              userProviderData==null ? IconButton(onPressed: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage(),
                  ),
                );

              }, icon: const Icon(Icons.person)) : IconButton(onPressed: (){

              }, icon: const Icon(Icons.home))
            ] ,
            title: const Text('AtypikHouse'),
            elevation: 5,
            automaticallyImplyLeading: true,
            backgroundColor: Constants.themeColorSecondary,
          ),
        ),
      body: Container(
        alignment: Alignment.center,
        child: Image.network(
          "${Constants.urlApi}/api/getOneAnnonceImageByImageId/?img_id=${id}"
          , fit: BoxFit.cover,
        ),
      ),
    );
  }
}
