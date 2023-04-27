import 'package:flutter/material.dart';
import 'package:login_api/models/User.dart';
import 'package:login_api/screens/client/chatApp/screenConversation.dart';

import '../../services/api_service.dart';
import '../../services/constants.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';


import 'package:login_api/providers/userProvider.dart';
import 'package:provider/provider.dart';

class MessagesClients extends StatefulWidget {
  const MessagesClients({Key? key}) : super(key: key);

  @override
  _MessagesClientsState createState() => _MessagesClientsState();

}


class _MessagesClientsState extends State<MessagesClients> {
  final ApiUserService _apiUserService = ApiUserService();

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

        body: FutureBuilder(

        future: _apiUserService.getUserConversations(context.watch<UserProvider>().user!["id"]! ?? 2),

    builder: (context,snapshot){

    if (snapshot.hasData) {

      return ListView.builder(

        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 10),
        shrinkWrap: true,
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {


          return GestureDetector(
            onTap: (){

              context.read<UserProvider>().conversation=snapshot.data[index];



              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ScreenConversation(),
                    settings: RouteSettings(
                        arguments: snapshot.data[index],
                    )
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,

              margin: EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: snapshot.data[index].messages[snapshot.data[index].messages.length-1]["readinState"]!=0 ?  Color.fromRGBO(182, 182, 182, 0.6) : Constants.blueColor2,
              ),
              padding: EdgeInsets.symmetric(vertical: 10),
              width: screenWidth,
              child: ListTile(
                  title: Text('${snapshot.data[index]
                      .userAccount['lastname']} ${snapshot.data[index]
                      .userAccount['firstname']}', style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black,
                  ),),
                  leading:


                  Container(

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: FadeInImage(
                        imageErrorBuilder: (context, exception, stackTrace) {
                          print('Error Handler');
                          return Container(
                            width: 100.0,
                            height: 100.0,
                            child: Image.asset('assets/images/man.png'),
                          );
                        },
                        placeholder: AssetImage('assets/images/loading.gif'),
                        image: NetworkImage('${Constants
                            .urlApi}/api/sendUserAvatarImage/${snapshot
                            .data[index].userAccount['id']}'),

                        fit: BoxFit.cover,

                      ),
                    ),

                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      snapshot.data[index].messages[snapshot.data[index].messages.length-1]["content"].length > 20 ?
                      Text('${snapshot.data[index].messages[snapshot.data[index].messages.length-1]["content"].substring(0, 20)+'...'}',
                        style: TextStyle(
                          fontSize: snapshot.data[index].messages[0]["read_at"]!=null ? 12 : 14,

                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),) :   Text('${snapshot.data[index].messages[snapshot.data[index].messages.length-1]["content"]}',
                        style: TextStyle(
                          fontSize: snapshot.data[index].messages[0]["read_at"]!=null ? 12 : 14,

                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),),


                      Text("${snapshot.data[index].messages[0]["created_at"]}")


/*
                      Text("${DateFormat('dd-MM-YYYY').format(DateTime.parse(snapshot.data[index].messages[0]["created_at"]))}")
*/

                    ],
                  ),
                  trailing: snapshot.data[index].messages[snapshot.data[index].messages.length-1]["readingState"]==0 ?   SizedBox(
                    width: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.fiber_manual_record, color: Colors.blueAccent,
                          size: 15,),
                      ],
                    ),
                  ) : Container(width: 0,)
              ),
            ),
          );

        },);

    }else {
      print('${snapshot}');
      return Container
        (height: screenHeight, width: screenWidth,
          child: Center(child: const CircularProgressIndicator()));
    }



    }
    )
    );
  }
}
