import 'package:flutter/material.dart';
import 'package:login_api/providers/annonceProvider.dart';
import 'package:login_api/providers/userProvider.dart';
import 'package:login_api/services/routing.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:login_api/providers/reservationProvider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ReservationProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AnnonceProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: Routing.getRoutes().routeInformationParser,
      routeInformationProvider: Routing.getRoutes().routeInformationProvider,
      routerDelegate: Routing.getRoutes().routerDelegate,
    );
  }
}
