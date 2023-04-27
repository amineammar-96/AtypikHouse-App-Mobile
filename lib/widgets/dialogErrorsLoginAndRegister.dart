import 'package:flutter/material.dart';

void dialogErrors(BuildContext context, dynamic text) async {
  // show the loading dialog
  showDialog(
    // The user CANNOT close this dialog  by pressing outsite it
      context: context,
      builder: (_) {
        return SizedBox(
          child: AlertDialog(
            actions: [
              Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        //to set border radius to button
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    child: Text("Compris !"),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                  )),
            ],
            // The background color
            backgroundColor: Colors.white,
            content: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // The loading indicator
                  const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 70,
                  ),
                  SizedBox(
                    height: 15,
                    width: MediaQuery.of(context).size.width,
                  ),
                  // Some text
                  Text("${text}")
                ],
              ),
            ),
          ),
        );
      });
}

void fetchData(BuildContext context) async {
  // show the loading dialog
  showDialog(
    // The user CANNOT close this dialog  by pressing outsite it
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return Dialog(
          // The background color
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                // The loading indicator
                CircularProgressIndicator(),
                SizedBox(
                  height: 15,
                ),
                // Some text
                Text('Chargement...')
              ],
            ),
          ),
        );
      });
}