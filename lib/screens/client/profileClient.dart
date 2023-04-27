import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:login_api/models/User.dart';
import 'package:login_api/providers/userProvider.dart';
import 'package:login_api/screens/client/historiqueOwer.dart';
import 'package:login_api/screens/client/historiqueReservation/historiqueReservation.dart';
import 'package:login_api/screens/client/persenolInfo/personelInfo.dart';
import 'package:login_api/screens/login_page.dart';
import 'package:provider/provider.dart';
import '../../services/api_service.dart';
import '../../services/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class ProfileClient extends StatefulWidget {
  const ProfileClient({Key? key}) : super(key: key);

  @override
  _ProfileClientState createState() => _ProfileClientState();
}

late Future<User> futureUser;

class _ProfileClientState extends State<ProfileClient> {
  final ApiUserService _apiUserService = ApiUserService();

  var loading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future loadData() async {
    setState(() {
      loading = true;
    });

    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        loading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    var connectedUser =context.read<UserProvider>().user!;

/*
    var connectedUser = {'id': 2,
    'role' : 'client'};*/

    var screenWidth = MediaQuery.of(context).size.width;

    var screenHeight = MediaQuery.of(context).size.height;

    if (!loading) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
                future: _apiUserService.getUser(connectedUser['id']),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var user = snapshot.data;
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25.0),
                          child: SizedBox(
                              width: 100.0,
                              height: 100.0,
                              child: FutureBuilder(
                                  future: _apiUserService
                                      .getUser(connectedUser['id']),
                                  builder: (context, snapshot) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: FadeInImage(
                                        imageErrorBuilder:
                                            (context, exception, stackTrace) {
                                          return Container(
                                            width: 40.0,
                                            height: 40.0,
                                            child: Image.asset(
                                                'assets/images/man.png'),
                                          );
                                        },
                                        placeholder: AssetImage(
                                            'assets/images/loading.gif'),
                                        image: NetworkImage(
                                            '${Constants.urlApi}/api/sendUserAvatarImage/${connectedUser['id']}'),
                                      ),
                                    );
                                  })),
                        ),
                        SizedBox(
                          width: screenWidth - 2,
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: screenWidth,
                                    child: DecoratedBox(
                                      decoration: const BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 8.0),
                                            child: Text(
                                              "${user[0].lastname} ${user[0].firstname}",
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 8.0),
                                            child: Text(
                                              "${user[0].email}",
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 18),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20, horizontal: 20),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Column(
                                                    children: [
                                                      FutureBuilder(
                                                          future: _apiUserService
                                                              .getUserReservations(
                                                                  connectedUser[
                                                                      'id']),
                                                          builder: (context,
                                                              snapshot) {
                                                            if (snapshot
                                                                .hasData) {
                                                              var reservationsCount =
                                                                  0;
                                                              if (snapshot
                                                                      .data !=
                                                                  0) {
                                                                reservationsCount =
                                                                    snapshot
                                                                        .data
                                                                        .length;
                                                              }

                                                              return Text(
                                                                '${reservationsCount}',
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        26),
                                                              );
                                                            } else {
                                                              return const CircularProgressIndicator();
                                                            }
                                                          }),
                                                      const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 6.0),
                                                        child: Text(
                                                          'Réservations',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Column(
                                                    children: [
                                                      FutureBuilder(
                                                          future: _apiUserService
                                                              .getUserNotifications(
                                                                  connectedUser[
                                                                      'id']),
                                                          builder: (context,
                                                              snapshot) {
                                                            if (snapshot
                                                                .hasData) {
                                                              var notificationCount =
                                                                  0;
                                                              if (snapshot
                                                                      .data !=
                                                                  0) {
                                                                notificationCount =
                                                                    snapshot
                                                                        .data
                                                                        .length;
                                                              }

                                                              var notifications =
                                                                  snapshot.data;

                                                              var newNotificationsCount =
                                                                  0;

                                                              for (var i = 0;
                                                                  i < notificationCount;
                                                                  i++) {
                                                                print(i);
                                                                print(snapshot
                                                                    .data[i]
                                                                    .read_at);

                                                                if (snapshot
                                                                        .data[i]
                                                                        .read_at ==
                                                                    null) {
                                                                  newNotificationsCount++;
                                                                  print(
                                                                      'object ueees');
                                                                }
                                                              }
                                                              return Text(
                                                                '${newNotificationsCount}',
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        26),
                                                              );
                                                            } else {
                                                              return const CircularProgressIndicator();
                                                            }
                                                          }),
                                                      const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 6.0),
                                                        child: Text(
                                                          'Notifications',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Column(
                                                    children: [
                                                      FutureBuilder(
                                                          future: _apiUserService
                                                              .getUserConversations(
                                                                  connectedUser[
                                                                      'id']),
                                                          builder: (context,
                                                              snapshot) {
                                                            if (snapshot
                                                                .hasData) {
                                                              var conversationCount =
                                                                  0;
                                                              if (snapshot
                                                                      .data !=
                                                                  0) {
                                                                conversationCount =
                                                                    snapshot
                                                                        .data
                                                                        .length;
                                                              }

                                                              var newMessagesCount =
                                                                  0;

                                                              for (var i = 0;
                                                                  i < conversationCount;
                                                                  i++) {
                                                                var convReadState =
                                                                    false;

                                                                for (var j = 0;
                                                                    j <
                                                                        snapshot
                                                                            .data[i]
                                                                            .messages
                                                                            .length;
                                                                    j++) {
                                                                  if (snapshot.data[i].messages[j]
                                                                              [
                                                                              "receiver_user_id"] ==
                                                                          user[0]
                                                                              .id &&
                                                                      snapshot.data[i].messages[j]
                                                                              [
                                                                              "readingState"] ==
                                                                          "0") {
                                                                    convReadState =
                                                                        true;
                                                                  }
                                                                }

                                                                if (convReadState ==
                                                                    true) {
                                                                  newMessagesCount++;
                                                                }
                                                              }

                                                              return Text(
                                                                '${newMessagesCount}',
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        26),
                                                              );
                                                            } else {
                                                              return const CircularProgressIndicator();
                                                            }
                                                          }),
                                                      const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 6.0),
                                                        child: Text(
                                                          'Messages',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),



                        connectedUser['role']=='client' ?  GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HistoriqueOwner() ,

                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromRGBO(241, 239, 239  , 1),
                              ),
                              child: const ListTile(
                                minLeadingWidth: 1,
                                leading: Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Icon(
                                    FontAwesomeIcons.history,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                                trailing: Icon(
                                  FontAwesomeIcons.arrowRight,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                title: Text(("Réservation"),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18)),
                              ),
                            ),
                          ),
                        ) :  GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HistoriqueOwner() ,

                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromRGBO(241, 239, 239  , 1),
                              ),
                              child: const ListTile(
                                minLeadingWidth: 1,
                                leading: Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Icon(
                                    FontAwesomeIcons.history,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                                trailing: Icon(
                                  FontAwesomeIcons.arrowRight,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                title: Text(("Historiques"),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18)),
                              ),
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: (){

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const PersonelInfo() ,

                              ),
                            );

                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromRGBO(241, 239, 239  , 1),
                              ),
                              child: const ListTile(
                                minLeadingWidth: 1,
                                leading: Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Icon(
                                    FontAwesomeIcons.gear,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                                trailing: Icon(
                                  FontAwesomeIcons.arrowRight,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                title: Text(("Informations personnelles"),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18)),
                              ),
                            ),
                          ),
                        ),


                        GestureDetector(
                          onTap: (){
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromRGBO(241, 239, 239  , 1),
                              ),
                              child: const ListTile(
                                minLeadingWidth: 1,
                                leading: Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Icon(
                                    FontAwesomeIcons.lock,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                                trailing: Icon(
                                  FontAwesomeIcons.arrowRight,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                title: Text(("Politique de confidentialité"),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18)),
                              ),
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromRGBO(241, 239, 239  , 1),
                              ),
                              child: const ListTile(
                                minLeadingWidth: 1,
                                leading: Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Icon(
                                    FontAwesomeIcons.info,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                                trailing: Icon(
                                  FontAwesomeIcons.arrowRight,
                                  color: Colors.black,
                                  size: 24,
                                ),
                                title: Text(("Conditions d'utilisation"),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18)),
                              ),
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromRGBO(255, 86, 86, 1),
                              ),
                              child: const ListTile(
                                minLeadingWidth: 1,
                                leading: Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Icon(
                                    FontAwesomeIcons.signOut,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),

                                title: Text(("Se déconnecter"),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18)),
                              ),
                            ),
                          ),
                        ),

                      ],
                    );
                  } else {
                    return Container();
                  }
                }),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        ),
      );
    }
  }
}
