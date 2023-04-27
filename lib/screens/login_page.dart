import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_api/providers/userProvider.dart';
import 'package:provider/provider.dart';

import 'package:login_api/screens/owner/dashboardOwner.dart';
import 'package:login_api/screens/client/dashboardClient.dart';

import '../models/User.dart';
import '../services/constants.dart';
import '../widgets/dialogErrorsLoginAndRegister.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:go_router/go_router.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, this.user}) : super(key: key);

  final User? user;


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visibilyOfPassword = true;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Stack(
          alignment: Alignment.center,
          children: [
             Positioned(
              top: -screenHeight*0.47,
              left: -160,
              child: Image.asset('assets/images/mainTop.png'),
            ),




            Padding(
              padding:  EdgeInsets.only(top: screenHeight*0.19),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: SizedBox(
                      height: screenHeight*0.28,
                      child: SvgPicture.asset("assets/images/login.svg") ,
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical : 18.0),
                    child: Text("Connexion",                    style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.8,
                    padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                        color: Constants.textFieldBackgroundColor,
                        borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color:  Constants.textFieldBoxShadowBackgroundColor,
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: emailController,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Constants.textFieldTextBackgroundColor,
                      ),

                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "E-mail",
                        hintStyle:
                        TextStyle(color: Constants.textFieldTextBackgroundColor,
                            fontSize: 16),
                        icon: Icon(
                          Icons.person,
                          color: Constants.textFieldIconBackgroundColor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.8,
                    padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                        color: Constants.textFieldBackgroundColor,
                        borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color:  Constants.textFieldBoxShadowBackgroundColor,
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: passwordController,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Constants.textFieldTextBackgroundColor,
                      ),
                      obscureText: visibilyOfPassword,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Mot de passe",
                          hintStyle: const TextStyle(
                            color: Constants.textFieldTextBackgroundColor,
                            fontSize: 16,
                          ),
                          icon: const Icon(
                            Icons.lock,
                            color: Constants.textFieldIconBackgroundColor,
                          ),
                          suffixIcon: InkWell(
                              onTap: passwordToggleView,
                              child: visibilyOfPassword
                                  ? const Icon(
                                Icons.visibility,
                                color:
                                Constants.textFieldIconBackgroundColor,
                              )
                                  : const Icon(
                                Icons.visibility_off,
                                color:
                                Constants.textFieldIconBackgroundColor,
                              ))),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.8,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                          //to set border radius to button
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        login();
                      },
                      child: const Text("Se connecter", style:TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 10 , left: 40),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Padding(
                           padding: EdgeInsets.all(8.0),
                           child: GestureDetector(
                             child: const Text('Mot de passe oublié ?' , style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600
                        ),),
                           ),
                         ),

                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              context.pop();
                            },
                            child: const Text('Pas encore de compte chez AtypikHouse ?' , style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600
                            ),),
                          ),
                        ),
                      ],
                    )
                  ),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }




  Future<void> login() async {
    Uri url = Uri.parse('${Constants.urlApi}/api/login');

    var errors = {
      "email": "",
      "password": "",
    };

    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      fetchData(context);

      Future.delayed(const Duration(milliseconds: 1000), () async {
        if (true) {
          var response = await http.post(url, body: {
            "email": emailController.text,
            "password": passwordController.text,
          });
          var jsonResponse = jsonDecode(response.body);

          if (response.statusCode == 200) {
            errors['password'] = "";
            errors['email'] = "";
            if (jsonResponse["status"] == "success") {
              Navigator.of(context, rootNavigator: true).pop();

              ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                content: Text(
                  "${jsonResponse["user"][0]["role"]}",
                  textAlign: TextAlign.center,
                ),
                backgroundColor: Colors.pinkAccent,
                duration: Duration(milliseconds: 12900),
              ));





                var connectedUser={
                  "id" : jsonResponse["user"][0]["id"],
                  "lastname" : jsonResponse["user"][0]["lastname"],
                  "firstname" : jsonResponse["user"][0]["firstname"],
                  "email" : jsonResponse["user"][0]["email"],
                  "token" : jsonResponse["token"],
                  "role" : jsonResponse["user"][0]["role"],

                };


                  emailController.text="";
                  passwordController.text="";


                context.read<UserProvider>().user=connectedUser;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const dashboardClient(),
                  settings: RouteSettings(
                    arguments: connectedUser
                  )
                  ),
                );



            } else {
              Navigator.of(context, rootNavigator: true).pop();


              dialogErrors(context, "Veuillez vérifier votre adresse email ou le mot de passe");
            }
           }
          // else {
          //   if (jsonResponse['errors'].containsKey('email')) {
          //     errors['email'] = jsonResponse['errors']['email'][0];
          //   } else {
          //     errors['email'] = "";
          //   }

          //   if (jsonResponse['errors'].containsKey('password')) {
          //     errors['password'] = jsonResponse['errors']['password'][0];
          //   } else {
          //     errors['password'] = "";
          //   }

          //   Navigator.of(context, rootNavigator: true).pop();



          //   if (errors['email'] ==
          //       "The email must be a valid email address."){
          //       dialogErrors(context, "Veuillez saisir une adresse email valide");
          //   }
          //   else if (errors['password'] ==
          //       "The password must be at least 8 characters."){
          //     dialogErrors(context, "Le mot de passe doit comporter au moins 8 caractères.");
          //   }


          // }
        }
      });
    } else if (emailController.text.isEmpty &&
        passwordController.text.isEmpty) {

      dialogErrors(context, "Veuillez bien remplire les deux champs");


    } else if (emailController.text.isEmpty &&
        passwordController.text.isNotEmpty) {

      dialogErrors(context, "Veuillez saisir une adresse email");
    } else if (emailController.text.isEmpty ||
        passwordController.text.isEmpty) {

      dialogErrors(context, "Veuillez bien remplire les deux champs");
    }
  }

  void passwordToggleView() {
    setState(() {
      visibilyOfPassword = !visibilyOfPassword;
    });
  }


}
