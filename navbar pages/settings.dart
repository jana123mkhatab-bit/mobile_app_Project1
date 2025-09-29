import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // no back arrow
        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 133, 86, 213),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.lock, color: Colors.deepPurple),
            title: Text("Change Password"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.deepPurple),
            title: Text("Notifications"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language, color: Colors.deepPurple),
            title: Text("Language"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info, color: Colors.deepPurple),
            title: Text("About App"),
          ),
        ],
      ),
    );
  }
}
