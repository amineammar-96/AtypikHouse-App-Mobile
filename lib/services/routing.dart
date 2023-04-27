import 'package:go_router/go_router.dart';
import 'package:login_api/screens/atypikHouseInfo/atypikhousedetails.dart';
import 'package:login_api/screens/client/annonces/oneAnnonce.dart';
import 'package:login_api/screens/client/historiqueOwer.dart';
import 'package:login_api/screens/home_page.dart';
import 'package:login_api/screens/host_signup_page.dart';
import 'package:login_api/screens/login_page.dart';
import 'package:login_api/screens/signup_page.dart';
import 'package:login_api/screens/owner/dashboardOwner.dart';
import 'package:login_api/screens/client/dashboardClient.dart';
import 'package:login_api/screens/client/chatApp/screenConversation.dart';


import 'package:login_api/screens/client/persenolInfo/personelInfo.dart';
import 'package:login_api/screens/client/historiqueReservation/historiqueReservation.dart';
import 'package:login_api/screens/client/historiqueReservation/oneReservation.dart';

import '../screens/client/annonces/Annonces.dart';
import '../screens/client/annonces/imagesAnnonceScreen.dart';


class Routing{
  static GoRouter getRoutes(){
    return GoRouter(routes: [

      GoRoute(path: '/' , name: 'home' , builder: (context, state) => const HomePage(),),
      GoRoute(path: '/login' , name: 'login' , builder: (context, state) => const LoginPage(), ),
      GoRoute(path: '/signup' , name: 'signup' , builder: (context, state) => const SignupPage(), ),
      GoRoute(path: '/hostSignup' , name: 'hostSignup' , builder: (context, state) => const HostSignupPage(), ),
      GoRoute(path: '/atypikHouseDetails' , name: 'atypikHouseDetails' , builder: (context, state) => const AtypikHouseDetails(), ),
      GoRoute(path: '/historiqueOwner' , name: 'historiqueOwner' , builder: (context, state) => const HistoriqueOwner(), ),
      GoRoute(path: '/screenConversation' , name: 'screenConversation' , builder: (context, state) => const ScreenConversation(), ),
      GoRoute(path: '/personelInfo' , name: 'personelInfo' , builder: (context, state) => const PersonelInfo(), ),
      GoRoute(path: '/historiqueReservation' , name: 'historiqueReservation' , builder: (context, state) => const HistoriqueReservation(), ),
      GoRoute(path: '/oneReservation' , name: 'oneReservation' , builder: (context, state) => const Reservation(), ),
      GoRoute(path: '/annonces' , name: 'annonces' , builder: (context, state) => const Annonces(), ),
      GoRoute(path: '/annonceScreen' , name: 'annonceScreen' , builder: (context, state) => const AnnonceScreen(), ),
      GoRoute(path: '/imageAnnonceScreen' , name: 'imageAnnonceScreen' , builder: (context, state) => const ImageAnnonceScreen(id: null,), ),





    ]);
  }
}