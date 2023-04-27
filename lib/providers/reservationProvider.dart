import 'package:flutter/material.dart';
import 'package:login_api/models/Reservation.dart';

class ReservationProvider extends ChangeNotifier {

 /* Map<String, dynamic> ? _reservation;

  Map<String, dynamic> ? get reservation => _reservation;
  set reservation(Map<String, dynamic> ? instanceReservation) {
    _reservation = instanceReservation;
    notifyListeners();
  }*/

  Reservation? _reservation;

  Reservation? get reservation => _reservation;
  set reservation(Reservation? instanceReservation) {
    _reservation = instanceReservation;
    notifyListeners();
  }

}