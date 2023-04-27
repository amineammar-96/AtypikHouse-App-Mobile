
import 'package:flutter/material.dart';
import 'package:login_api/providers/annonceProvider.dart';
import 'package:login_api/screens/client/annonces/imagesAnnonceScreen.dart';
import 'package:login_api/services/constants.dart';
import 'package:login_api/screens/client/annonces/randomAnnonces.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../providers/userProvider.dart';



class AnnonceScreen extends StatefulWidget {
  const AnnonceScreen({Key? key}) : super(key: key);

  @override
  State<AnnonceScreen> createState() => _AnnonceScreenState();
}

class _AnnonceScreenState extends State<AnnonceScreen> {

  @override
  Widget build(BuildContext context) {


    var annonce = context.watch<AnnonceProvider>().annonce;
    var userProviderData = context.watch<UserProvider>().user;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(

          actions: [
            userProviderData==null ? IconButton(onPressed: (){

          }, icon: const Icon(Icons.person)) : IconButton(onPressed: (){

          }, icon: const Icon(Icons.home))
          ] ,
          title: const Text('AtypikHouse'),
          elevation: 5,
          automaticallyImplyLeading: true,
          backgroundColor: Constants.themeColorSecondary,
          ),
        ),

      body: Align(
        alignment: Alignment.center,

        child: SingleChildScrollView(
          child: Container(
            width: screenWidth,

            constraints: BoxConstraints(
                maxHeight: screenHeight*2,
                minHeight: screenHeight,
                minWidth: screenWidth,

            ),
            child: Stack(
              alignment: Alignment.center,

              children: [
                Positioned(
                  height: 350,
                  width: screenWidth,
                  top: 0,
                  child: Container(
                    width: screenWidth,
                    height: screenHeight/4,
                    decoration: const BoxDecoration(
                      color: Constants.blueColor1,
                    ),
                    child:  Image.network(
                      "${Constants.urlApi}/api/getOneAnnonceImageByImageId/?img_id=${annonce!.id}"
                      , fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  top: screenHeight/3,
                  width: screenWidth,
                  child: Container(
                    width: screenWidth,
                    margin: EdgeInsets.only(top: 10),

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(1),
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(40) , topLeft: Radius.circular(40)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Container(
                            width: screenWidth-50,
                              child:  Row(
                                children: [
                                  Icon(FontAwesomeIcons.tag , size: 18, color: Colors.grey,),
                                  SizedBox(width: 10,),
                                  Text('${annonce.typeLogement}' , style: const TextStyle( overflow: TextOverflow.ellipsis ,color: Colors.grey , fontWeight: FontWeight.w600 , fontSize: 16),),
                                ],
                              )),
                          const SizedBox(height: 15,),

                          Container(
                              width: screenWidth-50,
                              child:  Text('${annonce.title}' , style: const TextStyle( overflow: TextOverflow.ellipsis ,color: Colors.black , fontWeight: FontWeight.bold , fontSize: 20),)),

                          const SizedBox(height: 5,),
                          Container(
                              width: screenWidth-50,
                              child:  Row(
                                children: [
                                  Icon(FontAwesomeIcons.locationDot , size: 16, color: Colors.red,),
                                  Text('${annonce.city}' , style: const TextStyle( overflow: TextOverflow.ellipsis ,color: Colors.red , fontWeight: FontWeight.w600 , fontSize: 14),),
                                ],
                              )),
                          const SizedBox(height: 35,),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [


                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 18.0 , horizontal: 12),
                                    child: Icon(FontAwesomeIcons.bed , color: Colors.black,),
                                  ),
                                  Text('${annonce.numberOfBeds} lits', style: TextStyle(color: Colors.black, fontSize: 20 , fontWeight: FontWeight.w600),),
                                ],
                              ),

                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 18.0 , horizontal: 12),
                                    child: Icon(FontAwesomeIcons.expand , color: Colors.black,),
                                  ),
                                  Text('${annonce.surface} m²', style: TextStyle(color: Colors.black, fontSize: 20 , fontWeight: FontWeight.w600),),
                                ],
                              ),


                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 18.0 , horizontal: 12),
                                    child: Icon(FontAwesomeIcons.peopleGroup , color: Colors.black, size: 35,),
                                  ),
                                  Text('${annonce.capacity}' , style: TextStyle(color: Colors.black, fontSize: 20 , fontWeight: FontWeight.w600),),
                                ],
                              ),



                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 18.0 , horizontal: 12),
                                    child: Icon(FontAwesomeIcons.paw , color: Colors.black, size: 35,),
                                  ),
                                  annonce.animaux=="oui" ?  Icon(FontAwesomeIcons.checkCircle , color: Colors.green, size: 30,): Icon(FontAwesomeIcons.circleXmark , color: Colors.red, size: 30,)
                                ],
                              ),


                            ],
                          ),
                          const SizedBox(height: 15,),

                          Container(
                              width: screenWidth-50,
                              child:  Text('Description' , style: const TextStyle( overflow: TextOverflow.ellipsis ,color: Colors.black , fontWeight: FontWeight.w700 , fontSize: 20),)),

                          const SizedBox(height: 5,),

                          Container(
                              width: screenWidth-50,
                              child:  Text('${annonce.description}' , style: const TextStyle( overflow: TextOverflow.clip ,color: Colors.grey , fontWeight: FontWeight.w500 , fontSize: 16),)),
                          const SizedBox(height: 10,),

                          Container(
                              width: screenWidth-50,
                              child:  Text('${annonce.informationsSupp}' , style: const TextStyle( overflow: TextOverflow.clip ,color: Colors.grey , fontWeight: FontWeight.w500 , fontSize: 16),)),

                          const SizedBox(height: 20,),

                          Text('Photos' , style: const TextStyle( overflow: TextOverflow.ellipsis ,color: Colors.black , fontWeight: FontWeight.w700 , fontSize: 20),),
                          const SizedBox(height: 20,),

                          Container(
                            padding: EdgeInsets.only(bottom: 20),
                            constraints: BoxConstraints(
                              maxWidth: 2000,
                              maxHeight: 200,
                              minHeight: 100,
                            ),
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: (annonce.images!).length,
                                itemBuilder: (context , imageIndex){
                                  return SizedBox(
                                    width: 200,
                                    height: 100,
                                    child: AspectRatio(aspectRatio: 3/2 , child:
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ImageAnnonceScreen(id: annonce.images![imageIndex]['id'],),
                                              ));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(right: 14),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            image: DecorationImage(
                                              image: NetworkImage('${Constants.urlApi}/api/getAnnonceCoverImageFromApi/?id=${annonce.id}'),
                                              fit: BoxFit.cover,
                                            ),

                                          ),

                                        ),
                                      ),),
                                  );
                                }),
                          ),


                          Text('Localisation' , style: const TextStyle( overflow: TextOverflow.ellipsis ,color: Colors.black , fontWeight: FontWeight.w700 , fontSize: 20),),
                          const SizedBox(height: 10,),
                          Column(
                            children: [
                              SizedBox(
                                  width : screenWidth-50,
                                  child: Text('${annonce.address}' , style: const TextStyle( overflow: TextOverflow.clip ,color: Colors.grey , fontWeight: FontWeight.w500 , fontSize: 17),)),



                              annonce.compAddress!="" ?  SizedBox(
                                  width : screenWidth-50,
                                  child: Text('${annonce.compAddress}' , style: const TextStyle( overflow: TextOverflow.clip ,color: Colors.grey , fontWeight: FontWeight.w500 , fontSize: 17),)) : Container(height: 0,),




                              SizedBox(
                                    width : screenWidth-50,
                                    child: Text('${annonce.city} ${annonce.postalCode}' , style: const TextStyle( overflow: TextOverflow.clip ,color: Colors.grey , fontWeight: FontWeight.w500 , fontSize: 17),)),


                              SizedBox(
                                  width : screenWidth-50,
                                  child: Text('${annonce.country}' , style: const TextStyle( overflow: TextOverflow.clip ,color: Colors.grey , fontWeight: FontWeight.w500 , fontSize: 17),)),
                            ],
                          ),


                          const SizedBox(height: 10,),
                          Text('Propriétaire' , style: const TextStyle( overflow: TextOverflow.ellipsis ,color: Colors.black , fontWeight: FontWeight.w700 , fontSize: 20),),
                          const SizedBox(height: 20,),

                          Row(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage('${Constants.urlApi}/api/sendUserAvatarImage/${annonce.user_id}'),
                                    fit: BoxFit.cover
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              SizedBox(width: 15,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${annonce.user!['lastname']} ${annonce.user!['firstname']}' , style: (const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  )),),
                                  Text('${annonce.user!['email']}' , style: (const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  )),)
                                ],
                              ),

                              SizedBox(width: 15,),

                              Row(
                                children: [
                                  IconButton(onPressed: (){
                                  }, icon: Icon(Icons.phone ,color: Constants.blueColor1,))
                                ],
                              ),

                              SizedBox(width: 5,),

                              Row(
                                children: [
                                  IconButton(onPressed: (){
                                  }, icon: Icon(Icons.message_sharp ,color: Constants.blueColor1,))
                                ],
                              )

                            ],
                          ),


                          const SizedBox(height: 20,),
                          Text('Avis clients' , style: const TextStyle( overflow: TextOverflow.ellipsis ,color: Colors.black , fontWeight: FontWeight.w700 , fontSize: 20),),
                          const SizedBox(height: 20,),

                          ListView.builder(
                            scrollDirection: Axis.vertical,
                              itemCount: 5,
                              shrinkWrap: true,

                              itemBuilder: (context, index) {
                            return ListTile(
                              title: Text('AMMAR Amine'),
                              subtitle: Text('Lorem fdpsdf Opsim DFrt g'),
                              leading: Container(
                                height: 70,
                                width: 70,
                                decoration:  BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage('${Constants.urlApi}/api/sendUserAvatarImage/${annonce.user_id}'),
                                      fit: BoxFit.cover
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              trailing: SizedBox(
                                width: 50,
                                child: Row(
                                  children: [
                                    Icon(Icons.star , color : Colors.yellow),
                                    Text("4.7" , style: TextStyle(color : Colors.black),)
                                  ],
                                ),
                              ),

                            );
                          }),






                        ],
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
