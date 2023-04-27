import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:login_api/models/Annonce.dart';
import 'package:login_api/screens/client/annonces/oneAnnonce.dart';

import 'package:login_api/services/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../providers/annonceProvider.dart';
import '../../../services/api_service.dart';

class RandomAnnonces extends StatefulWidget {
  const RandomAnnonces({Key? key}) : super(key: key);

  @override
  State<RandomAnnonces> createState() => _RandomAnnoncesState();
}

class _RandomAnnoncesState extends State<RandomAnnonces> {
  final ApiUserService _apiUserService = ApiUserService();


  @override
  Widget build(BuildContext context) {

    var screenWidth = MediaQuery.of(context).size.width;

    var screenHeight = MediaQuery.of(context).size.height;




    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        constraints: const BoxConstraints(

            maxHeight: 285,

        ),
        child: Row(
          children: [
            FutureBuilder(
              future: _apiUserService.getAnnonces(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  var annonces=snapshot.data;
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: InkWell(
                        onTap: (){
    context.read<AnnonceProvider>().annonce=annonces[index];
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const AnnonceScreen() ),

    );

                        },
                        child: Container(
                          width: 232,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [BoxShadow(
                              color: Colors.black12.withOpacity(0.05),
                              offset: const Offset(0, 0),
                              blurRadius: 16,
                            )]
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14)),
                                  image: DecorationImage(fit: BoxFit.cover,
                                   image: NetworkImage("${Constants.urlApi}/api/getAnnonceCoverImageFromApi/?id=${annonces[index].id}")
                                  ),)
                                ),
                              Padding(padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [

                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(FontAwesomeIcons.locationDot, size: 16, color: Colors.redAccent),
                                          SizedBox(
                                            width:150,
                                            child: Text('${((annonces[index].city))}' ,overflow: TextOverflow.ellipsis , style: const TextStyle(
                                              fontSize: 14 , color: Colors.red , fontWeight: FontWeight.w500 ,
                                            ),),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width:200,
                                                child: Text('${annonces[index].title}' ,overflow: TextOverflow.ellipsis , style: const TextStyle(
                                                  fontSize: 14 , color: Colors.black , fontWeight: FontWeight.w600 ,
                                                ),),
                                              ),
                                              SizedBox(
                                                width:200,
                                                child: Text('${((annonces[index].typeLogement))}' ,overflow: TextOverflow.ellipsis , style: const TextStyle(
                                                  fontSize: 14 , color: Colors.grey , fontWeight: FontWeight.w500 ,
                                                ),),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),


                                    ],
                                  ),
                                  SizedBox(height: 10,),



                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(

                                        padding: EdgeInsets.all(7),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                        ) ,
                                        child: Text('${((annonces[index].price))}' , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold , color: Colors.black),),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star , color: Colors.yellow, size: 26,),
                                          Text("4.7", style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w700 , color: Colors.black),)
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),)
                            ],
                          ),
                        ),
                      ),
                    );
                  });
                }else {

                  print(snapshot);
                  return const CircularProgressIndicator();
                }
              }) ,


          ],
        ),
      ),
    );
  }
}
