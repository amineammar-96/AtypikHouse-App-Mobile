import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:login_api/providers/reservationProvider.dart';
import 'package:login_api/screens/client/historiqueReservation/oneReservation.dart';
import 'package:provider/provider.dart';

import '../../../services/api_service.dart';
import '../../../services/constants.dart';

class HistoriqueReservation extends StatefulWidget {
  const HistoriqueReservation({Key? key}) : super(key: key);

  @override
  State<HistoriqueReservation> createState() => _HistoriqueReservationState();
}

class _HistoriqueReservationState extends State<HistoriqueReservation> {
  final ApiUserService _apiUserService = ApiUserService();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(
            title: Text('AtypikHouse'),
            elevation: 5,
            automaticallyImplyLeading: true,
            backgroundColor: Constants.themeColorSecondary,
          ) ),
      body: Container(
          width: screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Réservations' , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 20),),
              ),

              Expanded(
                child: FutureBuilder(
                  future: _apiUserService.getUserReservations(2),
                  builder: (context, snapshot) {
                    if(snapshot.hasData && snapshot.data!=0 ){
                      print(snapshot.data[0]);
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: screenWidth,


                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          color: Colors.black12
                                      )
                                    ]
                                ) ,
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                            height: 210,
                                            width: screenHeight-16,
                                            child: GestureDetector(
                                              onTap: (){
                                                context.read<ReservationProvider>().reservation=snapshot.data[index];
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => const Reservation() ),

                                                );
                                              },
                                              child: Image.network(
                                                "${Constants.urlApi}/api/getAnnonceCoverImageFromApi/?id=${snapshot.data[index].annonce['id']}"
                                                , fit: BoxFit.cover,
                                              ),
                                            )),

                                        Container(
                                            padding: EdgeInsets.all(12),
                                            constraints: BoxConstraints(
                                                maxWidth: 130
                                            ),
                                            alignment: Alignment.topLeft,
                                            decoration: BoxDecoration(
                                              color: Constants.blueColor1,

                                            ),
                                            child: Center(
                                              child: Text(
                                                '${snapshot.data[index].bookState}',
                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13.0),
                                              ),
                                            )),

                                      ],
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(width:200, child: Text("${snapshot.data[index].annonce['title']}" ,style: TextStyle( fontSize: 16, fontWeight: FontWeight.bold , color: Colors.black),)),
                                              Text("#ATKRES0000${snapshot.data[index].id}" , style: TextStyle( fontSize: 15 , fontWeight: FontWeight.w600 , color: Colors.black.withOpacity(0.3)),),
                                            ],
                                          ),
                                          SizedBox(height: 10),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 18.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text("${reveseDateReservation(snapshot.data[index].checkIn)}" , style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold , color: Colors.black),),
                                                Text("-" , style: TextStyle( fontSize: 22, fontWeight: FontWeight.bold , color: Colors.black),),
                                                Text("${reveseDateReservation(snapshot.data[index].checkOut)}" , style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold , color: Colors.black),),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text("Réservé le ${snapshot.data[index].created_at}" , style: TextStyle( fontSize: 16, fontWeight: FontWeight.w600 , color: Colors.black),),
                                            ],
                                          ),
                                          SizedBox(height: 5),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text("Nombre de nuits : ${snapshot.data[index].nightCount}" , style: TextStyle( fontSize: 16, fontWeight: FontWeight.w600 , color: Colors.black),),
                                            ],
                                          ),
                                          SizedBox(height: 20),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: [
                                                    true ?
                                                    ElevatedButton(onPressed: (){},
                                                        style: ElevatedButton.styleFrom(
                                                            backgroundColor: Colors.black
                                                        ),
                                                        child: Text('Commenter')) :
                                                    ElevatedButton(onPressed: (){},
                                                        style: ElevatedButton.styleFrom(
                                                            backgroundColor: Colors.red
                                                        ),
                                                        child: Text('Annuler')),

                                                    IconButton(
                                                      onPressed: (){

                                                        context.read<ReservationProvider>().reservation=snapshot.data[index];
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(builder: (context) => const Reservation() ,

                                                          ),
                                                        );
                                                      },
                                                      icon: Icon(Icons.remove_red_eye),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text("Total : €${snapshot.data[index].amount}" , style: TextStyle( fontSize: 16, fontWeight: FontWeight.w600 , color: Colors.black),),
                                            ],
                                          ),

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                  }else{
                      print(snapshot);
                      return Center(

                          child: const CircularProgressIndicator());
                    }
                  }),

                ),

            ],
          ),
        ),
      ),
    );
  }

   reveseDateReservation(date){

    var inputFormat = DateFormat('yyyy-MM-dd');
    var outputFormat = DateFormat('dd-MM-yyyy');


    var dateCh = inputFormat.parse('${date}');

    var dateFormatted = outputFormat.format(dateCh);

    return dateFormatted;

  }
}
