import 'package:flutter/material.dart';
import '../../services/constants.dart';
import '../../widgets/app_bar_first.dart';
import 'contact.dart';
import 'aboutUs.dart';

class AtypikHouseDetails extends StatefulWidget {
  const AtypikHouseDetails({Key? key}) : super(key: key);

  @override
  _AtypikHouseDetailsState createState() => _AtypikHouseDetailsState();
}

class _AtypikHouseDetailsState extends State<AtypikHouseDetails> {
  int selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    AboutUsPage(),ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var screenWidth =  MediaQuery
        .of(context)
        .size
        .width;

    var screenHeight =  MediaQuery
        .of(context)
        .size
        .height;





    return Scaffold(
      extendBodyBehindAppBar: false,

      appBar:const AppBarFirst(),
    backgroundColor: Colors.white,
    body: Container(
      child: SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: Stack(
      alignment: Alignment.center,
      children: [
      /*Positioned(
      top: -screenHeight*0.53,
      left: -160,
      child: Image.asset('assets/images/mainTop.png'),
      ),*/
        Container(
          child: _widgetOptions.elementAt(selectedIndex),
        )
      ]
      ),),
    ),
      bottomNavigationBar: SizedBox(
        height: 115,
        child: BottomNavigationBar(

          unselectedLabelStyle: const TextStyle(color: Colors.red , fontWeight: FontWeight.bold),
           selectedLabelStyle: const TextStyle(color: Constants.themeColor , fontWeight: FontWeight.bold),
          selectedItemColor: Constants.blueColor1,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
            backgroundColor: Constants.themeColorSecondary,
            currentIndex: selectedIndex,
            iconSize: 20,
            onTap: _onItemTapped,
            elevation: 5,
            items: const <BottomNavigationBarItem>[

            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.info),
              ),
              label: 'Qui sommes-nous?',
              backgroundColor: Colors.green,

            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.red,
              icon: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.mail ),
              ),
              label: 'Contact',


            ),

          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
