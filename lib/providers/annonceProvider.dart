import 'package:flutter/material.dart';
import 'package:login_api/models/Annonce.dart';

class AnnonceProvider extends ChangeNotifier {

  Annonce? _annonce;
  Annonce? get annonce => _annonce;
  set annonce(Annonce? instanceAnnonce) {
    _annonce = instanceAnnonce;
    notifyListeners();
  }

}