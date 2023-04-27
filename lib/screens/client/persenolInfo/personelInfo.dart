import 'package:flutter/material.dart';

import '../../../services/api_service.dart';
import '../../../services/constants.dart';

class PersonelInfo extends StatefulWidget {
  const PersonelInfo({Key? key}) : super(key: key);

  @override
  State<PersonelInfo> createState() => _PersonelInfoState();


}

class _PersonelInfoState extends State<PersonelInfo> {

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
    child: AppBar(
      actions: [
        IconButton(onPressed: (){

        }, icon: Icon(Icons.edit))
      ],
      title: Text('AtypikHouse'),
      elevation: 5,
      automaticallyImplyLeading: true,
      backgroundColor: Constants.themeColorSecondary,
    ) ),

    body: Container(
        width: screenWidth ,
      height: screenHeight-50,
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: FutureBuilder(
        future: _apiUserService.getUserInfo(2) ,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Column(
              children:  [
                  Padding(
                    padding: EdgeInsets.only(right: 6.0 , left: 6 , top: screenHeight*0.05 , bottom: screenHeight*0.05),
                    child: Text('Informations personnelles' , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.w600),),
                  ),
                


              ListTile(
                minLeadingWidth: 30
                ,title: const Text("Nom et prénom" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w600),),
                subtitle: Text('${snapshot.data['user'][0]["lastname"]} ${snapshot.data['user'][0]["firstname"]}' , style: TextStyle(fontSize: 16),),
                leading: Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    width: 0,
                    child: Icon(Icons.info_outline)),
            ),
                ListTile(
                  minLeadingWidth: 30
                  ,title: const Text("E-mail" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w600),),
                  subtitle: Text('${snapshot.data['user'][0]["email"]}' , style: TextStyle(fontSize: 16),),
                  leading: Container(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      width: 0,
                      child: Icon(Icons.info_outline)),
                ),
                ListTile(
                  minLeadingWidth: 30
                  ,title: const Text("Téléphone" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w600),),
                  subtitle: Text('${snapshot.data['userInfo'][0]["phone"]}' , style: TextStyle(fontSize: 16),),
                  leading: Container(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      width: 0,
                      child: Icon(Icons.info_outline)),
                ),
                ListTile(
                  minLeadingWidth: 30
                  ,title: const Text("Adresse postale" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w600),),
                  subtitle: Text('${snapshot.data['userInfo'][0]["address"]}' , style: TextStyle(fontSize: 16),),
                  leading: Container(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      width: 0,
                      child: Icon(Icons.info_outline)),
                ),
                ListTile(
                  minLeadingWidth: 30
                  ,title: const Text("Complément d'adresse" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w600),),
                  subtitle: Text('${snapshot.data['userInfo'][0]["addressComp"]!=null ? '${snapshot.data['userInfo'][0]["addressComp"]}' : '...' }' , style: TextStyle(fontSize: 16),),
                  leading: Container(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      width: 0,
                      child: Icon(Icons.info_outline)),
                ),
                ListTile(
                  minLeadingWidth: 30
                  ,title: const Text("Code postale" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w600),),
                  subtitle: Text('${snapshot.data['userInfo'][0]["postalCode"]}' , style: TextStyle(fontSize: 16),),
                  leading: Container(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      width: 0,
                      child: Icon(Icons.info_outline)),
                ),
                ListTile(
                  minLeadingWidth: 30
                  ,title: const Text("Ville" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w600),),
                  subtitle: Text('${snapshot.data['userInfo'][0]["city"]}' , style: TextStyle(fontSize: 16),),
                  leading: Container(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      width: 0,
                      child: Icon(Icons.info_outline)),
                ),
                ListTile(
                  minLeadingWidth: 30
                  ,title: const Text("Pays" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w600),),
                  subtitle: Text('${snapshot.data['userInfo'][0]["country"]}' , style: TextStyle(fontSize: 16),),
                  leading: Container(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      width: 0,
                      child: Icon(Icons.info_outline)),
                ),


                ListTile(
                  minLeadingWidth: 30
                  ,title: const Text("Pour modifier vos informations veuillez vous connecter sur le site AtypikHouse.com" , style: TextStyle(fontSize: 18 , color: Colors.redAccent , fontWeight: FontWeight.w700),),
                  leading: Container(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      width: 0,
                      child: Icon(Icons.warning ,  color: Colors.redAccent)),
                ),


              ],
            ) ;

          }else{
            return const CircularProgressIndicator();
          }
        }),
      ),
    );
  }
}
