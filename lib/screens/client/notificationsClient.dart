import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/userProvider.dart';
import '../../services/api_service.dart';
import '../../services/constants.dart';

import 'package:url_launcher/url_launcher.dart';

class NotificationsClient extends StatefulWidget {
  const NotificationsClient({Key? key}) : super(key: key);

  @override
  _NotificationsClientState createState() => _NotificationsClientState();
}



class _NotificationsClientState extends State<NotificationsClient> {
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
        future: _apiUserService.getUserNotifications(context.watch<UserProvider>().user!["id"]! ?? 2),
        builder: (context,snapshot){
    if (snapshot.hasData) {
      return ListView.builder(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 10),
          shrinkWrap: true,
          itemCount: snapshot.data!.length,
          itemBuilder: (context,index){

            return Container(
              alignment: Alignment.center,

              margin: EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: snapshot.data[index].read_at==null ?  Color.fromRGBO(182, 182, 182   ,0.6) : Color.fromRGBO(236, 236, 236 ,0.6),
              ),
             padding: EdgeInsets.symmetric(vertical: 10),
              width: screenWidth,
              child: ListTile(
                title: Text('${snapshot.data[index].from_user['lastname']} ${snapshot.data[index].from_user['firstname']}' , style: TextStyle(
                  fontWeight: snapshot.data[index].read_at!=null ? FontWeight.w500 : FontWeight.w700,
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
                      placeholder: AssetImage('assets/images/loading.gif' ),
                      image: NetworkImage('${Constants.urlApi}/api/sendUserAvatarImage/${snapshot.data[index].from_user['id']}' ),

                      fit: BoxFit.cover,

                    ),
                  ),

                ),
                subtitle: Text('${snapshot.data[index].content}',style: TextStyle(
                  fontSize:  18,

                  fontWeight: snapshot.data[index].read_at!=null ? FontWeight.w500 : FontWeight.w700,
                  color: Colors.black,
                ),),
                trailing: SizedBox(
                  width: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      snapshot.data[index].read_at==null ? Icon(
                         Icons.fiber_manual_record , color: Colors.blueAccent,  size: 15,)
                          : Container(),
                      IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onPressed: () async {
                            await  goToWebPage('${Constants.urlApi}/${snapshot.data[index].link}');
                          }, icon: Icon(Icons.link , color: Colors.black,)),

                    ],
                  ),
                )
              ),
            );

          },);
    }else {
      print('${snapshot}');
      return Container
        (height: screenHeight, width: screenWidth,
          child: Center(child: const CircularProgressIndicator()));
    }
    },

      ),
    );



  }

  Future<void> goToWebPage(String urlString) async {
    final Uri _url = Uri.parse(urlString);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
  void changeNotificationReadAtFun() {
    _apiUserService.changeNotificationReadAt(3);

  /*  setState((){

    });*/
  }

}
