import 'package:flutter/material.dart';
import 'package:login_api/screens/login_page.dart';
import 'package:login_api/services/constants.dart';
import 'package:login_api/screens/client/annonces/randomAnnonces.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../providers/userProvider.dart';



class Annonces extends StatefulWidget {
  const Annonces({Key? key}) : super(key: key);

  @override
  State<Annonces> createState() => _AnnoncesState();
}

class _AnnoncesState extends State<Annonces> {

  @override
  Widget build(BuildContext context) {
    var userProviderData = context.watch<UserProvider>().user;


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
    automaticallyImplyLeading: false,
    backgroundColor: Constants.themeColorSecondary,
    ) ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
                Padding(padding: const EdgeInsets.fromLTRB(30, 30, 30, 0) ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const Text('Découvrez nos hébergements' , style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                    ),),
                    const SizedBox(height: 30),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [BoxShadow(
                          blurRadius: 16,
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 0)
                        )],
                      ),
                      child: TextField(style: TextStyle(color: Colors.black , fontSize: 14 , fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        suffixIcon: Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.fromLTRB(4, 8, 8, 8),
                          decoration: BoxDecoration(
                            color: Constants.blueColor1,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.search , color: Colors.white,),
                        ),

                        hintText: "Trouvez les logements de vos réves...",
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 20
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.black12)
                        )

                      ),),
                    ),

                    SizedBox(height: 30,),
                    Text('Recommandé pour vous' , style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600
                    ),),
                    SizedBox(height: 10,),
                    RandomAnnonces(),

                    SizedBox(height: 30,),
                    Text('Les mieux notés' , style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600
                    ),),
                    SizedBox(height: 10,),
                    RandomAnnonces(),

                  ],
                ),)
            ],
          )
        ),
      ),
    );
  }
}
