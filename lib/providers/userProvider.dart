
import 'package:flutter/material.dart';
import '../Models/User.dart';

import '../models/Conversation.dart';

class UserProvider extends ChangeNotifier {
  Map<String, dynamic> ? _user;
  Map<String, dynamic> ? get user => _user;

  set user( Map<String, dynamic> ? instanceUser) {
    _user = instanceUser;
    notifyListeners();
  }


  String? _token;
  String? get token => _token;

  set token(String? instanceToken) {
    _token = instanceToken;
    notifyListeners();
  }



  Conversation ? _conversation;
  Conversation ? get conversation => _conversation;

  set conversation( Conversation ? instanceConversation) {
    _conversation = instanceConversation;
    notifyListeners();
  }




}
