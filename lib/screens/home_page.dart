import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_api/services/constants.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    var screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AtypikHouse',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(alignment: Alignment.center, children: [
          Positioned(
            width: screenWidth*0.8,
            top: screenHeight * 0.15,
            left: MediaQuery.of(context).size.width * 0.1,
            child: Image.asset('assets/images/atypikHouseLogo.png'),
          ),
          /*Positioned(
            top: -screenHeight * 0.42,
            left: -160,
            child: Image.asset('assets/images/mainTop.png'),
          ),*/
         /* Positioned(
            top: screenHeight * 0.3,
            left: screenWidth * 0.10,
            width: screenWidth * 0.8,
            child: SvgPicture.asset("assets/images/wallpaper.svg"),
          ),*/
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SizedBox(
                        height: screenHeight*0.32,
                        width: screenWidth*0.8,
                        child: Image.asset("assets/images/wallpaper.png" , ) ,
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: SizedBox(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                context.pushNamed('login');
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black87,
                                  minimumSize: const Size.fromHeight(50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              child: const Text(
                                "Se connecter",
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                context.pushNamed('signup');
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Constants.blueColor1,
                                  minimumSize: const Size.fromHeight(50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              child: const Text(
                                "Inscription",
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                context.pushNamed("hostSignup");
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Constants.blueColor2,
                                  minimumSize: const Size.fromHeight(50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              child: const Text(
                                "Devenir hôte",
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:  EdgeInsets.only(left : screenWidth*0.07 , top: screenHeight*0.01 ),
                          child:  SizedBox(
                            width: 200,
                            child: GestureDetector(
                              onTap: (){
                                context.pushNamed('atypikHouseDetails');
                              },
                              child: const Text(
                                "C'est quoi AtypikHouse ? ",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
