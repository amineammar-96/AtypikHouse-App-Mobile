
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:login_api/providers/reservationProvider.dart';
import 'package:provider/provider.dart';

import '../../../services/api_service.dart';
import '../../../services/constants.dart';

class Reservation extends StatefulWidget {
  const Reservation({Key? key}) : super(key: key);

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  final ApiUserService _apiUserService = ApiUserService();

  late GoogleMapController googleMapsController;

  static const CameraPosition initialCameraPosition = CameraPosition(target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);
  Set<Marker> markers = {};


  @override
  Widget build(BuildContext context) {
    var reservation = context.watch<ReservationProvider>().reservation;
    var annonce = reservation!.annonce as Map;
    var images = reservation.images as List;
    Random random = new Random();

/*
    String checkInCh=reservation.checkIn?.replaceAll(new RegExp(r'[^\w\s]+'),'') as String ;
*/

    var inputFormat = DateFormat('yyyy-MM-dd');
    var outputFormat = DateFormat('dd-MM-yyyy');


    var checkInCh = inputFormat.parse('${reservation.checkIn}');
    var checkOutCh = inputFormat.parse('${reservation.checkOut}');

    var checkInFormatted = outputFormat.format(checkInCh);
    var checkOutFormatted = outputFormat.format(checkOutCh);



    var outputFormatAux = DateFormat('yyyy-MM-dd');

    var checkInFormattedAux = outputFormatAux.format(checkInCh);
    var checkOutFormattedAux = outputFormatAux.format(checkOutCh);

    DateTime startDate = DateTime.parse(checkInFormattedAux);
    DateTime endDate = DateTime.parse(checkOutFormattedAux);
    DateTime toDayDate = DateTime.now();
   var dateIsBefore = startDate.isBefore(toDayDate);
    var dateisAfter = endDate.isAfter(toDayDate);




    var screenWidth = MediaQuery.of(context).size.width;

    var screenHeight = MediaQuery.of(context).size.height;



    return Scaffold(
      appBar: AppBar(
        title: const Text('AtypikHouse'),
        backgroundColor: Constants.themeColorSecondary,
      ),

      body: Align(
        alignment: Alignment.center,

        child: SingleChildScrollView(
          child: Container(
            width: screenWidth,

            constraints: BoxConstraints(
              maxHeight: screenHeight+200,
              minHeight: screenHeight
            ),
            child: Stack(
              alignment: Alignment.center,

              children: [
                Stack(
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
                        "${Constants.urlApi}/api/getOneAnnonceImageByImageId/?img_id=${images[random.nextInt(images.length-1)]['id']}"
                        , fit: BoxFit.cover,
                      ),
                    ),
                  ),
                    Positioned(
                        top: 0,


                        child: Container(
                          
                          padding: EdgeInsets.all(8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Constants.blueColor1,
                          ),
                            constraints: BoxConstraints(
                              minWidth: 100,
                            ),

                            child:Text('${reservation.bookState}' , style: TextStyle(color: Colors.white , fontSize: 14 , fontWeight: FontWeight.w600),)
                        )),
                  ],
                ),

                Positioned(
                  top: screenHeight/3,
                  width: screenWidth,
                  child: Container(
                    width: screenWidth,

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(1),
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(40) , topLeft: Radius.circular(40)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  child: const Text('Réservation détails' , style: TextStyle(color: Colors.black , fontWeight: FontWeight.w700 , fontSize: 18),)),
                              Container(
                                  child: Text("#ATKRES0000${reservation.id}" , style: TextStyle( fontSize: 15 , fontWeight: FontWeight.w600 , color: Colors.black.withOpacity(0.3)),),),


                            ],
                          ),

                          const SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 0,
                                child: const Icon(
                                  Icons.calendar_month,

                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:  [
                                  const Text('Check in' , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.w500 , fontSize: 15),),
                                  const SizedBox(height: 5,),
                                  Text('${checkInFormatted}' , style: const TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 22),),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text('' , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 22),),

                                  Text('-' , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 22),),
                                ],
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:  [
                                  const Text('Check out' , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.w500 , fontSize: 15),),
                                  const SizedBox(height: 5,),

                                  Text('${checkOutFormatted}' , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 22),),
                                ],
                              ),
                            ],
                          ),


                          const SizedBox(height: 30,),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              const Text('Nombre de nuits' , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.w700 , fontSize: 16),),
                              const SizedBox(height: 5,),
                              Text('${reservation.nightCount }' , style: const TextStyle(color: Colors.black , fontWeight: FontWeight.w700 , fontSize: 16),),
                            ],
                          ),

                          const SizedBox(height: 30,),

                         Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              const Text('Total payé' , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.w700 , fontSize: 16),),
                              const SizedBox(height: 5,),
                              Text('€${reservation.amount }' , style: const TextStyle(color: Colors.black , fontWeight: FontWeight.w700 , fontSize: 16),),
                            ],
                          ),

                          const SizedBox(height: 30,),


                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              const Text('Réservé le ' , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.w700 , fontSize: 16),),
                              const SizedBox(height: 5,),
                              Text('€${reservation.created_at }' , style: const TextStyle(color: Colors.black , fontWeight: FontWeight.w700 , fontSize: 16),),
                            ],
                          ),

                          const SizedBox(height: 30,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              const Text('Adresse postale' , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.w700 , fontSize: 16),),
                              const SizedBox(height: 5,),
                              Text('${annonce["address"] }' , style: const TextStyle(color: Colors.black , fontWeight: FontWeight.w700 , fontSize: 16),),
                            ],
                          ),

                          const SizedBox(height: 20,),


                          annonce['compAddress']!="" ?  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              const Text('Adresse complémentaire' , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.w700 , fontSize: 16),),
                              const SizedBox(height: 5,),
                              Text('${annonce["compAddress"] }' , style: const TextStyle(color: Colors.black , fontWeight: FontWeight.w700 , fontSize: 16),),
                            ],
                          ) : Container(height: 0,),





                          const SizedBox(height: 20,),


                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              const Text('Ville' , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.w700 , fontSize: 16),),
                              const SizedBox(height: 5,),
                              Text('${annonce["city"] }' , style: const TextStyle(color: Colors.black , fontWeight: FontWeight.w700 , fontSize: 16),),
                            ],
                          ),


                          const SizedBox(height: 20,),


                         Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              const Text('Code postale' , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.w700 , fontSize: 16),),
                              const SizedBox(height: 5,),
                              Text('${annonce["postalCode"] }' , style: const TextStyle(color: Colors.black , fontWeight: FontWeight.w700 , fontSize: 16),),
                            ],
                          ),


                          const SizedBox(height: 20,),


                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              const Text('Pays' , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.w700 , fontSize: 16),),
                              const SizedBox(height: 5,),
                              Text('${annonce["country"] }' , style: const TextStyle(color: Colors.black , fontWeight: FontWeight.w700 , fontSize: 16),),
                            ],
                          ),

                          const SizedBox(height: 20,),


                          ((dateisAfter && dateIsBefore) || (dateIsBefore && reservation.bookState!="Annulée")  ) ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                               ElevatedButton(onPressed: (){}, child: Text('Commenter') , style: ElevatedButton.styleFrom(
                                 backgroundColor:  Constants.blueColor1
                               ),)
                            ],
                          ):Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(onPressed: (){}, child: Text('Annuler') , style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent
                              ),)
                            ],
                          )






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



  Future determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}
