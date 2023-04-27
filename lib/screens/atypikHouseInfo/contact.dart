import 'package:flutter/material.dart';
import '../../services/constants.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
    
    return Container(
        margin: EdgeInsets.only(top: screenHeight*0.02),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only( top: 30 , bottom: 10),
                  child: Text("Contactez-nous" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 25),),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Utilisez notre formulaire de contact pour toute demande d'information ou contactez-nous directement en utilisant nos coordonnées." , style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 17),),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: screenWidth,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30) , topRight: Radius.circular(30)),
                    color: Color.fromRGBO(  208, 223, 244 ,1),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.9,
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
                        child: const TextField(
                          style: TextStyle(
                            fontSize: 16,
                            color: Constants.textFieldTextBackgroundColor,
                          ),

                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Nom complet",
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
                            .width * 0.9,
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
                        child: const TextField(
                          style: TextStyle(
                            fontSize: 16,
                            color: Constants.textFieldTextBackgroundColor,
                          ),

                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "E-mail",
                            hintStyle:
                            TextStyle(color: Constants.textFieldTextBackgroundColor,
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
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.9,
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
                        child: const TextField(
                          style: TextStyle(
                            fontSize: 16,
                            color: Constants.textFieldTextBackgroundColor,
                          ),

                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Objet",
                            hintStyle:
                            TextStyle(color: Constants.textFieldTextBackgroundColor,
                                fontSize: 16),
                            icon: Icon(
                              Icons.info,
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
                            .width * 0.9,
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
                        child: const TextField(
                          maxLines: null,
                          minLines: 5,
                          keyboardType: TextInputType.multiline,
                          style: TextStyle(
                            fontSize: 16,
                            color: Constants.textFieldTextBackgroundColor,
                          ),

                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Message...",
                            hintStyle:
                            TextStyle(color: Constants.textFieldTextBackgroundColor,
                                fontSize: 16),

                          ),
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 30),
                        width: screenWidth*0.6,
                        height: 50,
                        child: ElevatedButton(onPressed: (){}, child: const Text('Envoyer', style: TextStyle(fontWeight: FontWeight.bold  , fontSize: 16),) , style:
                        ElevatedButton.styleFrom(
                            backgroundColor: Constants.themeColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)
                          ),)),
                      ),
                    ],
                  ),
                ),


                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30) , bottomRight: Radius.circular(30)),
                    color: Colors.black87,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){}, icon: const Icon(Icons.facebook) , color: Colors.white,),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.facebook) , color: Colors.white,),

                      IconButton(onPressed: (){}, icon: const Icon(Icons.facebook) , color: Colors.white,)
                    ],
                  ),
                )



              ],
            ),
          ),
        ),
    );
  }
}
