import 'package:flutter/material.dart';
import 'package:login_api/screens/login_page.dart';
import 'package:provider/provider.dart';
import '../../models/User.dart';
import '../../providers/userProvider.dart';
import '../../services/constants.dart';

import '../../widgets/app_bar_first.dart';

import './messagesClients.dart';
import './notificationsClient.dart';
import './profileClient.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class dashboardClient extends StatefulWidget {
  const dashboardClient({Key? key}) : super(key: key);

  @override
  _DashboardClientState createState() => _DashboardClientState();
}

class _DashboardClientState extends State<dashboardClient> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {


   /* var userProviderData = context.watch<UserProvider>().user;
*/




    var screenWidth =  MediaQuery
        .of(context)
        .size
        .width;

    var screenHeight =  MediaQuery
        .of(context)
        .size
        .height;





    const List<Widget> _widgetOptions = <Widget>[
     ProfileClient(),NotificationsClient() , MessagesClients(),
    ];

    /*if(userProviderData!=null){*/

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        extendBodyBehindAppBar: false,

        appBar: const AppBarFirst(),
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
            currentIndex: selectedIndex,
            iconSize: 20,

            onTap: _onItemTapped,
            elevation: 1,
            backgroundColor: Colors.black87,
            items: const <BottomNavigationBarItem>[

              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(FontAwesomeIcons.solidUser ,),
                ),
                label: 'Profile',
                backgroundColor: Colors.green,


              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.red,
                icon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(FontAwesomeIcons.solidBell, ),
                ),
                label: 'Notifications',

              ),

              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(FontAwesomeIcons.solidEnvelope, ),
                ),
                label: 'Messages',
                backgroundColor: Colors.green,

              ),


            ],
          ),
        ),
      ),
    );
    /*}else {
      return Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Text('not loggedIn')
        ),
      );
    }*/
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
