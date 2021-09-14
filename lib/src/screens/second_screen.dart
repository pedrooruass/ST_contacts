import 'package:agenda_contatos/src/core/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondScreen extends StatelessWidget {
  final ContactModel contacts;
  SecondScreen({
    this.contacts,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts Details"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(contacts.image),
              radius: 55,
            ),
            SizedBox(height: 15),
            buildInfoRow(info: contacts.name, title: "Nome"),
            buildInfoRow(info: contacts.email, title: "Email"),
            buildInfoRow(info: contacts.tel, title: "Contato"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // print("Pedro".replaceAll("P", ""));
                      launch(
                          "http://www.google.com/maps/search/?api=1&query=${contacts.coordinates.replaceAll("{", "").replaceAll("}", "")}");
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: Text(
                      "Maps",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      launch("tel: +1 8478903233");
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                    child: Text(
                      "Ligar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow({@required String title, @required String info}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title: ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              info,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
