import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:login_api/models/Annonce.dart';
import 'package:login_api/models/Conversation.dart';
import 'package:login_api/models/Message.dart';
import 'package:login_api/models/Notification.dart';
import 'package:path_provider/path_provider.dart';

import '../models/User.dart';
import '../models/Reservation.dart';

import './constants.dart';

class ApiUserService {


//get user info from rest api
  Future getUser(id) async {

    String fileName="userData.json";

    var directory = await getTemporaryDirectory();

    File file = new File('${directory}/${fileName}');

    if(file.existsSync()){
      var jsonData = file.readAsStringSync();
      return(json.decode(jsonData));
    }else{

    Uri url = Uri.parse('${Constants.urlApi}/api/getUser');
    http.Response response = await http.post(url , body: {
      "id": id.toString(),

    });
    if (response.statusCode == 200) {

/*
      file.writeAsStringSync(response.body , flush: true , mode: FileMode.write);
*/

      final data = jsonDecode(response.body);
      return data['users']
          .map((e) =>
          User(
            id: e['id'],
            email: e['email'],
            userInfo: e['user_info'],
            firstname: e['firstname'],
            lastname: e['lastname'],
          )) .toList() ;


      } else {
      throw Error();

    }
    }
    }


    //get UserConversations()
  Future getUserConversations(id) async {
    Uri url = Uri.parse('${Constants.urlApi}/api/getUserMessages');
    http.Response response = await http.post(url, body: {
      "id": id.toString(),
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if(data['conversations'].length>0) {
        return data['conversations']
            .map((e) =>
            Conversation(
              id: e['id'],
              user_id: e['user_id'],
              receiver_id: e['receiver_id'],
              avatar: e['avatar'],
              userAccount: e['userAccount'],
              messages: e['messages'],
              created_at: e['created_at'],
              updated_at: e['updated_at'],
            )).toList();
      }else{
        return 0;
      }
    } else {
      throw Error();
    }

  }

  Future getUserConversationsById(id) async {
    Uri url = Uri.parse('${Constants.urlApi}/api/getConversationById');
    http.Response response = await http.post(url, body: {
      "id": id.toString(),
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if(data['conversations'].length>0) {
        return data['conversations']
            .map((e) =>
            Conversation(
              id: e['id'],
              user_id: e['user_id'],
              receiver_id: e['receiver_id'],
              avatar: e['avatar'],
              userAccount: e['userAccount'],
              messages: e['messages'],
              created_at: e['created_at'],
              updated_at: e['updated_at'],
            )).toList();
      }else{
        return 0;
      }
    } else {
      throw Error();
    }

  }

  Future getUserConversationMessages(id) async {
    Uri url = Uri.parse('${Constants.urlApi}/api/getConversationById');
    http.Response response = await http.post(url, body: {
      "id": id.toString(),
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
     /* data['conversations'][0]['messages'] = data['conversations'][0]['messages'].sort((a, b) {
        return a['id'].compareTo(b['id']);
      });*/

     /* var changed;
      do{
        changed = false;
        for(var i=0; i < data['conversations'][0]['messages'].length-1; i++) {
          if((data['conversations'][0]['messages'][i]['created_at']) > (data['conversations'][0]['messages'][i+1]['created_at'])) {
            var tmp = data['conversations'][0]['messages'][i];
            data['conversations'][0]['messages'][i] = data['conversations'][0]['messages'][i+1];
            data['conversations'][0]['messages'][i+1] = tmp;
            changed = true;
          }
        }
      } while(changed);
*/



      return data['conversations'][0]['messages']
            .map((e) =>
            Message(
              id: e['id'],
              content: e['content'],
              userAccount:e['userAccount'],
              sender_user_id: e['sender_user_id'],
              receiver_user_id: e['receiver_user_id'],
              readingState: e['readingState'],
              from_name: e['from_name'],
              to_name: e['to_name'],
              conversation_id: e['conversation_id'],
              created_at: e['created_at'],
              updated_at: e['updated_at'],
            )).toList();


    } else {
      throw Error();
    }

  }


  Future changeMessageReadingState(id , user_id) async {
    Uri url = Uri.parse('${Constants.urlApi}/api/changeMessageReadingState');
    http.Response response = await http.post(url, body: {
      "conversation_id": id.toString(),
      "userId" : user_id.toString(),
    });
/*
    print('data : ${data['notifications']}');
*/

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("hahahah : ${data}");
      return data;
    } else {
      throw Error();
    }
  }


  //get userReservation
  Future getUserReservations(id) async {
    Uri url = Uri.parse('${Constants.urlApi}/api/getReservationByUser');
    http.Response response = await http.post(url, body: {
      "user_id": id.toString(),
    });
/*
    print('data : ${data['notifications']}');
*/



    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if(data['reservations'].length>0) {
        return data['reservations']
            .map((e) =>
            Reservation(
              id: e['id'],
              user_id: e['user_id'],
              annonce_id: e['annonce_id'],
              annonce: e['annonce'],
              images: e['images'],

              bookState: e['bookState'],
              amount: e['amount'],
              paymentMethod: e['paymentMethod'],
              nightCount: e['nightCount'].toString(),
              checkIn: e['checkIn'],
              checkOut: e['checkOut'],
              created_at: e['created_at'],
              updated_at: e['updated_at'],
            )).toList();
      }else{
        return 0;
      }
    } else {
      throw Error();
    }
  }





  Future getUserNotifications(id) async {
    Uri url = Uri.parse('${Constants.urlApi}/api/getUserNotifications');
    http.Response response = await http.post(url, body: {
      "id": id.toString(),
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);


      if(data['notifications'].length>0) {
        return data['notifications']
            .map((e) =>
            Notification(
              id: e['id'],
              user_id: e['user_id'],
              from_id: e['from_id'],
              read_at: e['read_at'],
              content: e['content'],
              link: e['link'],
              type: e['type'],
              user: e['user'],
              from_user: e['from_user'],

              created_at: e['created_at'],
              updated_at: e['updated_at'],
            )).toList();
      }else {
        return 0;
      }

    } else {
      throw Error();
    }


  }





  Future changeNotificationReadAt(id) async {
    Uri url = Uri.parse('${Constants.urlApi}/api/changeNotificationReadAt');
    http.Response response = await http.post(url, body: {
      "id": id.toString(),
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['status'];
    } else {
      throw Error();
    }

  }





  Future getUserInfo(id) async {
    Uri url = Uri.parse('${Constants.urlApi}/api/getUserInfo');
    http.Response response = await http.post(url, body: {
      "id": id.toString(),
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if(data['userInfo'].length>0) {
        return data;

      }else{
        return 0;
      }
    } else {
      throw Error();
    }


  }





  Future getAnnonces() async {
    Uri url = Uri.parse('${Constants.urlApi}/api/getAnnonces');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('heeeerrrrrrre : ${data}');
      if(data['annonces'].length>0) {
        return data['annonces']
            .map((e) =>
            Annonce(
              id: e['id'],
              user_id: e['user_id'],
              surface: e['surface'],
              capacity: e['capacity'],
              price: e['price'],
              numberOfBeds: e['numberOfBeds'],
              optionsLogement: e['optionsLogement'],
              suppPropretiesAnnonce: e['suppPropretiesAnnonce'],
              type_logement_id: e['type_logement_id'],
              images: e['images'],
              title: e['title'],
              address: e['address'],
              compAddress: e['compAddress'],
              city: e['city'],
              postalCode: e['postalCode'],
              description: e['description'],
              country: e['country'],
              user: e['user'],

              animaux: e['animaux'],
              informationsSupp: e['informationsSupp'],
              servicesLogement: e['servicesLogement'],
              typeLogement: e['typeLogement'],

              created_at: e['created_at'],
              updated_at: e['updated_at'],
            )).toList();

      }else{
        return 0;
      }
    } else {
      throw Error();
    }

  }


}
