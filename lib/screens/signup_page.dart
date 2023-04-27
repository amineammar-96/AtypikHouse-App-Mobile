import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:go_router/go_router.dart';
import '../services/constants.dart';
import '../widgets/dialogErrorsLoginAndRegister.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  var lastnameController = TextEditingController();
  var firstnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var password_confirmationController = TextEditingController();

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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: -screenHeight * 0.37,
              left: -160,
              child: Image.asset('assets/images/mainTop.png'),
            ),
            SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.only(top: screenHeight*0.3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const Padding(
                      padding: EdgeInsets.only(bottom: 45.0 ,top: 20),
                      child: Text('Rejoignez-nous',
                      style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),),
                    ),

                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Constants.textFieldBoxShadowBackgroundColor,
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          color: Constants.textFieldBackgroundColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: TextField(
                        style: const TextStyle(
                          fontSize: 16,
                          color: Constants.textFieldTextBackgroundColor,
                        ),
                        controller: lastnameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Nom",
                          hintStyle: TextStyle(
                              color: Constants.textFieldTextBackgroundColor,
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
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Constants.textFieldBoxShadowBackgroundColor,
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          color: Constants.textFieldBackgroundColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: TextField(
                        controller: firstnameController,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Constants.textFieldTextBackgroundColor,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Prénom",
                          hintStyle: TextStyle(
                              color: Constants.textFieldTextBackgroundColor,
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
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Constants.textFieldBoxShadowBackgroundColor,
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          color: Constants.textFieldBackgroundColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: TextField(
                        controller: emailController,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Constants.textFieldTextBackgroundColor,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "E-mail",
                          hintStyle: TextStyle(
                              color: Constants.textFieldTextBackgroundColor,
                              fontSize: 16),
                          icon: Icon(
                            Icons.email,
                            color: Constants.textFieldIconBackgroundColor,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Constants.textFieldBoxShadowBackgroundColor,
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          color: Constants.textFieldBackgroundColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Constants.textFieldTextBackgroundColor,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Mot de passe",
                          hintStyle: TextStyle(
                              color: Constants.textFieldTextBackgroundColor,
                              fontSize: 16),
                          icon: Icon(
                            Icons.lock,
                            color: Constants.textFieldIconBackgroundColor,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Constants.textFieldBoxShadowBackgroundColor,
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          color: Constants.textFieldBackgroundColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: TextField(
                        controller: password_confirmationController,
                        obscureText: true,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Constants.textFieldTextBackgroundColor,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Répétez le mot de passe",
                          hintStyle: TextStyle(
                              color: Constants.textFieldTextBackgroundColor,
                              fontSize: 16),
                          icon: Icon(
                            Icons.lock,
                            color: Constants.textFieldIconBackgroundColor,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black87,
                          shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        onPressed: () {
                          SignupUser();
                        },
                        child: const Text("S'inscrire" , style:TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  final String principalUrl = "http://127.0.0.1:8000";

  Future<void> SignupUser() async {
    Uri url = Uri.parse('${principalUrl}/api/signupClient');
    if (lastnameController.text.isNotEmpty &&
        firstnameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        password_confirmationController.text.isNotEmpty) {
      var response = await http.post(url, body: {
        "lastname": lastnameController.text,
        "firstname": firstnameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "password_confirmation": password_confirmationController.text,
        "role": "client",
      });

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Votre compte à été bien créer"),
          backgroundColor: Colors.pinkAccent,
          duration: Duration(milliseconds: 4900),
        ));
        if (!mounted) return;
        context.pushNamed('login');
      } else {
        var jsonResponse = jsonDecode(response.body);
        dialogErrors(context, jsonResponse["errors"]);
        /* ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            response.body,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.blue,
          duration: const Duration(milliseconds: 4900),
        ));*/
      }

      print(response.body);
    } else {
      dialogErrors(context, "Veuillez remplire le formulaire");
    }
  }


}
