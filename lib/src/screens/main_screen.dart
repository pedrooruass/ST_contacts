import 'dart:convert';

import 'package:agenda_contatos/src/core/contact_model.dart';
import 'package:agenda_contatos/src/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<ContactModel> contacts = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getContacts();
  }

  Future<void> getContacts() async {
    setState(() => isLoading = true);

    http.Response response = await http
        .get("https://jsontests-default-rtdb.firebaseio.com/users.json");

    if (response.statusCode == 200) {
      final convertedToMap = json.decode(response.body);

      setState(() {
        contacts = (convertedToMap as List).map((map) {
          return ContactModel.fromMap(map);
        }).toList();
      });
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts Agenda"),
        centerTitle: true,
      ),
      body: Visibility(
        visible: !isLoading,
        child: ListView.separated(
          itemBuilder: (_, index) {
            return ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SecondScreen(contacts: contacts[index]);
                    },
                  ),
                );
              },
              title: Text(contacts[index].name),
              subtitle: Text(contacts[index].email),

              leading: CircleAvatar(
                //! PROVEDOR: IMAGEPROVIDER() - NETWORKIMAGE("url") - ASSETIMAGE("path").
                //! WIDGET - CHILD/CHILDREN: COMPONENTE VISUAL 99%X - IMAGE.ASSET(), IMAGE.NETWORK(), ETC ...
                backgroundImage: NetworkImage(contacts[index].image),
                radius: 27,
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            );
          },
          separatorBuilder: (_, index) => Divider(thickness: 2),
          itemCount: contacts.length,
        ),
        replacement: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(backgroundColor: Colors.black),
              SizedBox(
                height: 15,
              ),
              Text("Loading Contacts...",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
