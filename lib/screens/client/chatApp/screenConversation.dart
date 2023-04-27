import 'dart:convert';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:login_api/services/api_service.dart';
import 'package:login_api/services/constants.dart';
import 'package:provider/provider.dart';

import '../../../models/Conversation.dart';
import '../../../providers/userProvider.dart';
import '../../../widgets/dialogErrorsLoginAndRegister.dart';

class ScreenConversation extends StatefulWidget {
  const ScreenConversation({Key? key}) : super(key: key);

  @override
  State<ScreenConversation> createState() => _ScreenConversationState();
}

class _ScreenConversationState extends State<ScreenConversation> {
  final messageContentController = TextEditingController();
  final ApiUserService _apiUserService = ApiUserService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _apiUserService.changeMessageReadingState(Provider.of<UserProvider>(context, listen: false).conversation!.id! , 2  /*Provider.of<UserProvider>(context, listen: false).user!.id!*/);
    });

  }


  @override
  Widget build(BuildContext context) {


    var conversationId = context.watch<UserProvider>().conversation!.id!;

    var conversation = context.watch<UserProvider>().conversation;


    var connectedUser = {
      "id":context.watch<UserProvider>().user!['id'] ?? 0,
    };

    var screenWidth =  MediaQuery
        .of(context)
        .size
        .width;

    var screenHeight =  MediaQuery
        .of(context)
        .size
        .height;

    Future<void> sendMessage() async {
      Uri url = Uri.parse(
          '${Constants.urlApi}/api/sendMessageMobile');


      if (messageContentController.text.isNotEmpty) {
        Future.delayed(
            const Duration(milliseconds: 100), () async {

          var req = {
            "content": messageContentController.text,
            "conversation_id": conversationId,
            "connected_user": connectedUser["id"],
          };
          print(req);
          var response = await http.post(url, body: {
            "content": messageContentController.text,
            "conversation_id": conversationId.toString(),
            "connected_user": connectedUser["id"].toString(),
          });

          if(response.statusCode==200){
            print(response.body);
            messageContentController.text="";
            setState(() {
            });
          }
/*
          var jsonResponse = jsonDecode(response.body);
*/

        });
      }
    }




    return Scaffold(
    appBar: AppBar(
      backgroundColor: Constants.themeColorSecondary,
      title: FutureBuilder(
        future: _apiUserService.getUserConversationsById(conversationId),
        builder: (context,snapshot){
            if(snapshot.hasData){
              return
                  ListTile(
                    leading:  ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: FadeInImage(
                        imageErrorBuilder:
                            (context, exception, stackTrace) {
                          return Container(
                            width: 40.0,
                            height: 40.0,
                            child: Image.asset(
                                'assets/images/man.png'),
                          );
                        },
                        placeholder: AssetImage(
                            'assets/images/loading.gif'),
                        image: NetworkImage(
                            '${Constants.urlApi}/api/sendUserAvatarImage/${snapshot.data[0].userAccount['id']}'),
                      ),
                    ),
                    title: Text("${snapshot.data[0].userAccount["lastname"]} ${snapshot.data[0].userAccount["lastname"]}",
                    style: TextStyle(color: Colors.white),),
                  );
            }else {
              return CircularProgressIndicator();
            }
        },
      ),
    ),

    body: FutureBuilder(
    future: _apiUserService.getUserConversationMessages(conversationId),
      builder:  (context, snapshot) {
          if(snapshot.hasData && snapshot.data!=0 ){
            return  Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0 , left: 6 , right: 6),
                    child: ListView.builder(

                        reverse: true,
                        physics: ClampingScrollPhysics(),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context,index){

                          final reversedIndex = snapshot.data!.length - 1 - index;

                          var nextSender =0;
                          var nextReceiver=0;
                          if(reversedIndex<snapshot.data!.length-1) {
                            nextSender = snapshot.data[reversedIndex + 1].sender_user_id;

                            nextReceiver = snapshot.data[reversedIndex + 1].receiver_user_id;


                          }
                          return Column(
                            crossAxisAlignment: connectedUser["id"]==snapshot.data[reversedIndex].sender_user_id ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                              children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: connectedUser["id"]==snapshot.data[reversedIndex].sender_user_id ?  CrossAxisAlignment.end : CrossAxisAlignment.start  ,

                                  children: [
                                    Container(
                                      constraints: BoxConstraints(
                                        maxWidth: screenWidth*0.8,
                                      ),
                                      padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.symmetric(vertical: 10),

                                        decoration: BoxDecoration(
                                          boxShadow: [BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 2,
                                            blurRadius: 5
                                          )],
                                          color: connectedUser["id"]==snapshot.data[reversedIndex].sender_user_id ?  Color.fromRGBO(226, 226, 226 ,1) : Constants.blueColor1,
                                          borderRadius: BorderRadius.circular(30)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('${snapshot.data[reversedIndex].content}',style: TextStyle(
                                            fontSize: 17,
                                              color:  connectedUser["id"]==snapshot.data[reversedIndex].sender_user_id ?  Colors.black : Colors.white),),
                                        )),

                                    connectedUser["id"]==snapshot.data[reversedIndex].sender_user_id && nextReceiver!= snapshot.data[reversedIndex].receiver_user_id ?
                                       Text('${snapshot.data[reversedIndex].created_at}')
                                        : Container(width: 0,),


                                    connectedUser["id"]!=snapshot.data[reversedIndex].sender_user_id && nextSender!= snapshot.data[reversedIndex].sender_user_id ?
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            boxShadow: [BoxShadow(
                                              blurRadius: 5,
                                              spreadRadius: 2,
                                              color: Colors.grey.withOpacity(0.3)
                                            )],
                                          ),
                                          child: CircleAvatar(
                                            radius: 15,
                                            backgroundImage: NetworkImage(
                                                "${Constants
                                                .urlApi}/api/sendUserAvatarImage/${snapshot
                                                .data[reversedIndex].userAccount['id']}",

                                            ),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: Text('${snapshot.data[reversedIndex].created_at}'),
                                        )
                                      ],
                                    ) : Container(
                                      width: 0,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );

                        }
                    ),
                  ),
                ),
                Container(
                  height: 70,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      IconButton(onPressed: (){

                      }, icon: Icon(Icons.camera),),

                      SizedBox(

                        width: screenWidth*0.76,
                        child:  TextField(
                          controller: messageContentController,
                          decoration: const InputDecoration.collapsed(
                            hintText: 'Envoyer un message...'
                          ),
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ),

                      IconButton(
                          icon: Icon(Icons.send , color: Constants.blueColor1,),
                          onPressed: (){
                            sendMessage();
                          print(messageContentController.text);
                              }),


                    ],
                  ),
                )
              ],
            );
          }else{
            print('${snapshot}');
            return CircularProgressIndicator();
          }
      }),
    );
  }



}
